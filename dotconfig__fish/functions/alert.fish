function alert --description 'alias alert paplay /usr/share/sounds/Yaru/stereo/complete.oga & notify-send Completed (status current-commandline)'
  if test "$status" -eq 0
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga &
    notify-send Success (status current-commandline)
  else
    paplay /usr/share/sounds/Yaru/stereo/battery-low.oga &
    notify-send Failed (status current-commandline)
  end
        
end
