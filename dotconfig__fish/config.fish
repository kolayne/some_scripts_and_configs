if status is-interactive
    abbr --add '``' --position anywhere --set-cursor=% '(%)'

    abbr --add gco git checkout
    abbr --add --set-cursor=% gcl git clone git@github.com:%

    abbr --add vpna wg-quick up amsterdam
    abbr --add vpnad wg-quick down amsterdam

    abbr --add udmount udisksctl mount -b

    abbr --add inhib --set-cursor=% systemd-inhibit --what=%handle-lid-switch
end
