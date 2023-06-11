function yay --wraps yay --description 'Run yay with systemd-inhibit'
  systemd-inhibit --why="Package installation/removal/upgrade" yay $argv
        
end
