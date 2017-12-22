/*
 * author: Georg Schmidt <gs-develop@gs-sys.de>
 * version: 01.2017
 * location: /sbin/updater
 */

/*
 * Compile with
     gcc updater.c -o updater
 */

/*
 * Setup
    cp updater /sbin/updater
    chown root /sbin/updater
    chmod 4555 /sbin/updater
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    setuid(0);
    system("apt-get update");
    system("apt-get -y dist-upgrade");
    system("apt-get -y autoremove");
    system("apt-get -y autoclean");
    system("echo>>/var/log/updater-gs.log $(date)");
    return 0;
}