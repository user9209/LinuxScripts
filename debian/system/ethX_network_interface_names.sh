# to disable renaming ethX
# see:   dmesg | grep -i eth

nano /etc/default/grub

    # change
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

    # to
    GRUB_CMDLINE_LINUX_DEFAULT="net.ifnames=0 biosdevname=0 quiet splash"


# update config
update-grub