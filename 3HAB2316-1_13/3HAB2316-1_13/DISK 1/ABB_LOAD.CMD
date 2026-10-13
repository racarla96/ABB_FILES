Load -cpu MC -f ASCII -p flp1:/abb_boot.sys -a 0x802010
Load -cpu IOC -f OUT -p flp1:/abb_ioc.000 -a 0x38000 -c_hi 0x3a99 -c_lo 0x5476
Load -cpu MC -f OUT -p flp1:/abb_mc -a 0x2000 -s 1 -e 10
#
MemMC -mt 4 -rd 100 -pool 1100
MemMC -mt 5 -rd 100 -pool 1100
MemMC -mt 6 -rd 300 -pool 3780
MemMC -mt 11 -rd 200 -pool 1880
MemMC -mt 14 -rd 1000 -pool 5000
MemMC -mt 17 -rd 5000 -pool 6300
Release -cpu IOC
Exit
