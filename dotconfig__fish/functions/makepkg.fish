function makepkg --wraps makepkg --description 'Run makepkg with systemd-inhibit'
  systemd-inhibit --why="Building a package" makepkg $argv
        
end
