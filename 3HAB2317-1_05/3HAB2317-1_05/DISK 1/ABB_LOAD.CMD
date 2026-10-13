Load -cpu MC -f ASCII -p flp1:/abb_boot.sys -a 0x802010
Load -cpu IOC -f OUT -p flp1:/abb_ioc.000 -a 0x38000 -c_hi 0x75c1 -c_lo 0x111
Load -cpu MC -f OUT -p flp1:/abb_mc -a 0x2000 -s 1 -e 10
#
MemMC -mt 4 -rd 100 -pool 1100
MemMC -mt 5 -rd 100 -pool 1100
MemMC -mt 6 -rd 500 -pool 2380
MemMC -mt 11 -rd 100 -pool 1180
MemMC -mt 14 -rd 1300 -pool 3630
MemMC -mt 17 -rd 5000 -pool 6300
Release -cpu IOC
Exit
