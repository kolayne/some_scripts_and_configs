function topgrade --wraps topgrade --description 'Run topgrade with systemd-inhibit'
  systemd-inhibit --why="System upgrade" topgrade $argv
        
end
