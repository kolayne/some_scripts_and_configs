function alert --description 'Play sound and send notification when the previous command completes. Return with the $status of the previous command'
  set -l STATUS "$status"

  if test "$STATUS" -eq 0
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga &
    notify-send Success (status current-commandline)
  else
    paplay /usr/share/sounds/Yaru/stereo/battery-low.oga &
    notify-send Failed (status current-commandline)
  end

  return "$STATUS"
        
end
