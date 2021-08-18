#!/bin/bash

# This script, runned on a device with NoteBook FanControl set up, temporairly disables (*) the fans, and
# keeps track of the CPU cores' temperature to enable fans back in case the temperature gets too high.
# It also provides audio warnings in case something goes wrong. YOU SHOULD insert the path to an audio
# file you want to play as a warning to the `fail` function (this is currently hardcoded).
#
# (*) The script doesn't actually disable fans. In fact, it starts and stops nbfc service ~once per second,
# which leads to fans stopping on my own laptop. No idea how it should behave on other laptop models and for
# other vendors.


# When interrupted with ^C, try to start nbfc and exit with code `2`
trap "nbfc start; exit 2" INT

fail()
{
	paplay <PATH_TO_AUDIO_WARNING_FILE>
	exec false  # Exit with code 1
}

for((;;))
do
	awk '/Core/ {print +$3}' <(sensors || fail) |  # Retrieve cores' temperatures via `sensors`
		while read temp; do  # For each temperature
			# Using `bc` because `$temp` is a real number, not an integer
			if (( $(echo "$temp >= 50" | bc) )); then  # If temperature is 50 or more degrees
				nbfc start  # Start fans
				fail  # Play audio warning and exit
			fi
		done

	# If nbfc is stopped for long enough, BIOS (or firmware or whatever) takes control over the
	# fans and may enable them without our demand. The workaround is to start nbfc and then
	# stop it again
	nbfc start
	nbfc stop

	sleep 1
done
