function devil --wraps='sudo -Ebu $USER' --description 'Start a process in the background'
  sudo -Ebu $USER $argv
        
end
