Henry Post, <hpost@hawk.iit.edu>

ITMO 417

# Homework 4

## Console output

```
vagrant@vagrant:/ITMO417/homework/04$ ./hw4.sh
0: Exit
1: General server information (logged in users, load, disk space, RAM)
2: Find files with extension
3: Remove junk files in a dir (ending in [mp3 jpg gif o] or named exactly [core])
4: Create a new directory with perms=777 and stickybit on
5: Run the homework 2 shell script
6: Compress all files in your home directory
Select an option (1-6) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 1
Executing 'General server information (logged in users, load, disk space, RAM)'...

Logged in users:
vagrant  tty7         2019-09-24 00:45 (:0)

Processes using the CPU:
top - 00:48:10 up 3 min,  1 user,  load average: 0.44, 0.36, 0.16
Tasks: 175 total,   2 running, 110 sleeping,   0 stopped,   0 zombie
%Cpu(s): 12.5 us,  6.4 sy,  2.0 ni, 74.9 id,  3.6 wa,  0.0 hi,  0.5 si,  0.0 st
KiB Mem :  1008940 total,   159928 free,   304676 used,   544336 buff/cache
KiB Swap:  1003516 total,  1002480 free,     1036 used.   543788 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
18356 vagrant   30  10  601420 128152  84364 R 106.7 12.7   0:01.07 update-man+
 1911 vagrant   20   0  767948  34668  25560 S   6.7  3.4   0:01.48 x-terminal+
    1 root      20   0  225604   9376   6728 S   0.0  0.9   0:02.32 systemd
    2 root      20   0       0      0      0 S   0.0  0.0   0:00.00 kthreadd
    3 root      20   0       0      0      0 I   0.0  0.0   0:00.00 kworker/0:0
    4 root       0 -20       0      0      0 I   0.0  0.0   0:00.00 kworker/0:+
    5 root      20   0       0      0      0 I   0.0  0.0   0:00.19 kworker/u4+
    6 root       0 -20       0      0      0 I   0.0  0.0   0:00.00 mm_percpu_+

Processes using memory:
top - 00:48:10 up 3 min,  1 user,  load average: 0.44, 0.36, 0.16
Tasks: 175 total,   2 running, 110 sleeping,   0 stopped,   0 zombie
%Cpu(s): 12.5 us,  6.4 sy,  2.0 ni, 74.9 id,  3.6 wa,  0.0 hi,  0.5 si,  0.0 st
KiB Mem :  1008940 total,   159060 free,   305544 used,   544336 buff/cache
KiB Swap:  1003516 total,  1002480 free,     1036 used.   542924 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
18356 vagrant   30  10  604420 130960  84364 R  93.8 13.0   0:01.23 update-man+
  952 root      20   0  491092  51672  31484 S   0.0  5.1   0:01.77 Xorg
 1235 vagrant   20   0  542612  34676  17836 S   0.0  3.4   0:00.30 pcmanfm
 1911 vagrant   20   0  767948  34668  25560 S   0.0  3.4   0:01.48 x-terminal+
 1533 vagrant   20   0 96.729g  30020  24536 S   0.0  3.0   0:00.03 goa-daemon
 1226 vagrant   20   0  899516  27964  21968 S   0.0  2.8   0:00.22 lxpanel
 1304 vagrant   20   0  741068  22788  17852 S   0.0  2.3   0:00.07 nm-applet
 1551 vagrant   20   0  566820  22456  18012 S   0.0  2.2   0:00.06 update-not+

Disk space information:
Filesystem                    Size  Used Avail Use% Mounted on
udev                          462M     0  462M   0% /dev
tmpfs                          99M  6.5M   93M   7% /run
/dev/mapper/vagrant--vg-root   62G  5.1G   54G   9% /
tmpfs                         493M     0  493M   0% /dev/shm
tmpfs                         5.0M  4.0K  5.0M   1% /run/lock
tmpfs                         493M     0  493M   0% /sys/fs/cgroup
tmpfs                          99M   24K   99M   1% /run/user/1000
ITMO417                       755G  360G  395G  48% /ITMO417

Block device information:
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                      8:0    0   64G  0 disk 
└─sda1                   8:1    0   64G  0 part 
  ├─vagrant--vg-root   253:0    0   63G  0 lvm  /
  └─vagrant--vg-swap_1 253:1    0  980M  0 lvm  [SWAP]

System has been online for:
 00:48:10 up 3 min,  1 user,  load average: 0.44, 0.36, 0.16
 > 
Input a number.
0: Exit
1: General server information (logged in users, load, disk space, RAM)
2: Find files with extension
3: Remove junk files in a dir (ending in [mp3 jpg gif o] or named exactly [core])
4: Create a new directory with perms=777 and stickybit on
5: Run the homework 2 shell script
6: Compress all files in your home directory
Select an option (1-6) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 2
Executing 'Find files with extension'...
Enter path:
junk/data
Using '/ITMO417/homework/04/junk/data'.
Enter file extension (without '.'):
o
Files ending in 'o' in '/ITMO417/homework/04/junk/data':
20M -rwxrwxrwx 1 vagrant vagrant 20M Sep 24 00:47 /ITMO417/homework/04/junk/data/mycode1.o
20M -rwxrwxrwx 1 vagrant vagrant 20M Sep 24 00:47 /ITMO417/homework/04/junk/data/mycode2.o
20M -rwxrwxrwx 1 vagrant vagrant 20M Sep 24 00:47 /ITMO417/homework/04/junk/data/mycode3.o
 > 
Input a number.
0: Exit
1: General server information (logged in users, load, disk space, RAM)
2: Find files with extension
3: Remove junk files in a dir (ending in [mp3 jpg gif o] or named exactly [core])
4: Create a new directory with perms=777 and stickybit on
5: Run the homework 2 shell script
6: Compress all files in your home directory
Select an option (1-6) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 3
Executing 'Remove junk files in a dir (ending in [mp3 jpg gif o] or named exactly [core])'...
Files matching these patterns will be removed:
core
*.mp3
*.jpg
*.gif
*.o
Enter a directory to clear of junk files:
 > junk/data
removed 'core'
removed 'mycode1.o'
removed 'mycode2.o'
removed 'mycode3.o'
Done cleaning '/ITMO417/homework/04/junk/data'!
 > 
Input a number.
0: Exit
1: General server information (logged in users, load, disk space, RAM)
2: Find files with extension
3: Remove junk files in a dir (ending in [mp3 jpg gif o] or named exactly [core])
4: Create a new directory with perms=777 and stickybit on
5: Run the homework 2 shell script
6: Compress all files in your home directory
Select an option (1-6) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 5
Executing 'Run the homework 2 shell script'...
0: Exit
1: Ping a host
2: See hops to a host
3: Get a username from a UID
4: Zip a directory and send it via email
5: Send a file via email
Select an option (1-5) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 1
Executing 'Ping a host'...
Enter a host to ping:
 > 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=63 time=2.95 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=63 time=2.82 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=63 time=3.15 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=63 time=2.83 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3008ms
rtt min/avg/max/mdev = 2.823/2.944/3.158/0.149 ms
 > 
Input a number.
0: Exit
1: Ping a host
2: See hops to a host
3: Get a username from a UID
4: Zip a directory and send it via email
5: Send a file via email
Select an option (1-5) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 0
Executing 'Exit'...
Bye! :)
Returned from homework 2 shell script. This is homework 4's shell script.
 > 
Input a number.
0: Exit
1: General server information (logged in users, load, disk space, RAM)
2: Find files with extension
3: Remove junk files in a dir (ending in [mp3 jpg gif o] or named exactly [core])
4: Create a new directory with perms=777 and stickybit on
5: Run the homework 2 shell script
6: Compress all files in your home directory
Select an option (1-6) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 6
Executing 'Compress all files in your home directory'...
Directory at '/home/vagrant' is:
472KB,
0MB,
0GB.
Zipping '/home/vagrant'...
tar: Removing leading `/' from member names
/home/vagrant/
/home/vagrant/.sudo_as_admin_successful
/home/vagrant/Pictures/
/home/vagrant/.bashrc
/home/vagrant/.vboxclient-display.pid
/home/vagrant/Documents/
/home/vagrant/.vbox_version
/home/vagrant/Public/
/home/vagrant/.bash_logout
/home/vagrant/.Xauthority
/home/vagrant/.vboxclient-draganddrop.pid
/home/vagrant/Desktop/
/home/vagrant/.dmrc
/home/vagrant/.xscreensaver
/home/vagrant/Downloads/
/home/vagrant/.cache/
/home/vagrant/.cache/lxsession/
/home/vagrant/.cache/lxsession/Lubuntu/
/home/vagrant/.cache/lxsession/Lubuntu/run.log
/home/vagrant/.cache/openbox/
/home/vagrant/.cache/openbox/sessions/
/home/vagrant/.cache/openbox/openbox.log
/home/vagrant/.cache/motd.legal-displayed
/home/vagrant/.cache/menus/
/home/vagrant/.cache/menus/b302701ce85929aca9ad52c25e3577dc
/home/vagrant/.config/
/home/vagrant/.config/libfm/
/home/vagrant/.config/libfm/libfm.conf
/home/vagrant/.config/pcmanfm/
/home/vagrant/.config/pcmanfm/lubuntu/
/home/vagrant/.config/pcmanfm/lubuntu/desktop-items-0.conf
/home/vagrant/.config/user-dirs.locale
/home/vagrant/.config/user-dirs.dirs
/home/vagrant/.config/Trolltech.conf
/home/vagrant/.config/gtk-3.0/
/home/vagrant/.config/gtk-3.0/bookmarks
/home/vagrant/.config/lxsession/
/home/vagrant/.config/lxsession/Lubuntu/
/home/vagrant/.config/lxsession/Lubuntu/autostart
/home/vagrant/.config/lxsession/Lubuntu/desktop.conf
/home/vagrant/.config/openbox/
/home/vagrant/.config/openbox/lubuntu-rc.xml
/home/vagrant/.config/update-notifier/
/home/vagrant/.config/goa-1.0/
/home/vagrant/.config/dconf/
/home/vagrant/.config/dconf/user
/home/vagrant/.config/xfce4/
/home/vagrant/.config/xfce4/xfconf/
/home/vagrant/.config/xfce4/xfconf/xfce-perchannel-xml/
/home/vagrant/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml
/home/vagrant/.config/lxterminal/
/home/vagrant/.config/lxterminal/lxterminal.conf
/home/vagrant/.config/leafpad/
/home/vagrant/.config/leafpad/leafpadrc
/home/vagrant/.config/pulse/
/home/vagrant/.config/pulse/765dbda161bd4a63843e2b317ba243e8-stream-volumes.tdb
/home/vagrant/.config/pulse/765dbda161bd4a63843e2b317ba243e8-default-sink
/home/vagrant/.config/pulse/765dbda161bd4a63843e2b317ba243e8-device-volumes.tdb
/home/vagrant/.config/pulse/765dbda161bd4a63843e2b317ba243e8-default-source
/home/vagrant/.config/pulse/765dbda161bd4a63843e2b317ba243e8-card-database.tdb
/home/vagrant/.config/pulse/cookie
/home/vagrant/.config/lxpanel/
/home/vagrant/.config/lxpanel/launchtaskbar.cfg
/home/vagrant/.config/lxpanel/Lubuntu/
/home/vagrant/.config/lxpanel/Lubuntu/config
/home/vagrant/.config/lxpanel/Lubuntu/panels/
/home/vagrant/Music/
/home/vagrant/.gnupg/
/home/vagrant/.gnupg/private-keys-v1.d/
/home/vagrant/.vboxclient-seamless.pid
/home/vagrant/.local/
/home/vagrant/.local/share/
/home/vagrant/.xsession-errors
/home/vagrant/.profile
/home/vagrant/Videos/
/home/vagrant/.wget-hsts
/home/vagrant/Templates/
/home/vagrant/.ssh/
/home/vagrant/.ssh/authorized_keys
/home/vagrant/.vboxclient-clipboard.pid
Done!
Archive is at '/tmp/09-24-19-12:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz'.
32K -rw-rw-r-- 1 vagrant vagrant 32K Sep 24 00:48 /tmp/09-24-19-12:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz
 > 
Input a number.
0: Exit
1: General server information (logged in users, load, disk space, RAM)
2: Find files with extension
3: Remove junk files in a dir (ending in [mp3 jpg gif o] or named exactly [core])
4: Create a new directory with perms=777 and stickybit on
5: Run the homework 2 shell script
6: Compress all files in your home directory
Select an option (1-6) or 0 to exit. Anything else (i.e. 'h') to show this help again.
 > 0
Executing 'Exit'...
Bye! :)
vagrant@vagrant:/ITMO417/homework/04$ cd /tmp
vagrant@vagrant:/tmp$ xdg-open
xdg-open - opens a file or URL in the user's preferred application

Synopsis

xdg-open { file | URL }

xdg-open { --help | --manual | --version }

Use 'man xdg-open' or 'xdg-open --manual' for additional info.
vagrant@vagrant:/tmp$ xdg-open .
vagrant@vagrant:/tmp$ ls
09-24-19-12:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz
config-err-K7D0v9
ITMO417
ssh-cfCtsnHIEh1J
ssh-n0jdfIBLUo9M
systemd-private-ddc296ba66124e27bf85ca35e64fb348-rtkit-daemon.service-9O6tQw
systemd-private-ddc296ba66124e27bf85ca35e64fb348-systemd-resolved.service-90QOPo
vagrant-shell
vboxguest-Module.symvers
vagrant@vagrant:/tmp$ ls 09-24-19-12\:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz 
09-24-19-12:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz
vagrant@vagrant:/tmp$ ls 09-24-19-12\:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz  -lash
32K -rw-rw-r-- 1 vagrant vagrant 32K Sep 24 00:48 09-24-19-12:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz
vagrant@vagrant:/tmp$ ls 09-24-19-12\:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz  -lashx
32K 09-24-19-12:48AM-1569286131-548020ef-ed2e-4f08-a5d1-9d8954626ce0.tar.gz
vagrant@vagrant:/tmp$ 
```