Load -cpu MC -f ASCII -p flp1:/abb_boot.sys -a 0x802010
Load -cpu MC -f ASCII -p flp1:/addexp.txt -a 0x830003
Load -cpu IOC -f OUT -p compr:/flp1:/abb_ioc.000 -a 0x38000 -c_hi 0xd253 -c_lo 0xe607
Load -cpu MC -f OUT -p compr:/flp1:/abb_mc -a 0x2000 -s 1 -e 10
# Invalid memory sizes
MemMC -mt 4 -rd 100 -pool 500
MemMC -mt 5 -rd 100 -pool 500
MemMC -mt 11 -rd 100 -pool 500
MemMC -mt 6 -rd 100 -pool 500
# Valid memory sizes
MemMC -mt 14 -rd 500 -pool 3060
MemMC -mt 17 -rd 5000 -pool 6500
Release -cpu IOC
Exit
