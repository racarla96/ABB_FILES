Release -cpu NWC
SetWW -a 0x20000
# Init iopipe 
iomem_init
iopipe_init
# Init 
init -c repeat_init
init -c dispat_init
init -c react_init
init -c delay_init
# Create tasks
new -c repeat_new -n repeat00 -p 180 -o 0 -s 2000
new -c delay_new  -n delay_medium -p 100 -o 0 -s 2000
new -c react_new -n react00 -p 50 -o 0 -s 2000
new -c react_new -n react01 -p 60 -o 0 -s 2000
new -c react_new -n react02 -p 60 -o 0 -s 2000
new -c react_new -n react03 -p 60 -o 0 -s 2000
new -c dispat_new -n dispat00 -p 100 -o 0 -s 3000 -pn iocbase/sio00cmd -nm 2  -ms 500
new -c dispat_new -n dispat04 -p 80  -o 0 -s 5000 -pn iocbase/sio01write -nm 3 -ms 512
new -c dispat_new -n dispat05 -p 80 -o 0 -s 5000 -pn iocbase/sio04write -nm 3  -ms 512
new -c dispat_new -n dispat06 -p 80 -o 0 -s 5000 -pn iocbase/sio07write -nm 3  -ms 512
new -c dispat_new -n dispat01 -p 80  -o 0 -s 3000 -pn iocbase/eio00send -nm 10  -ms 120
new -c dispat_new -n dispat02 -p 120  -o 0 -s 3000 -pn iocbase/flp00send -nm 1  -ms 10000
new -c dispat_new -n dispat03 -p 130  -o 0 -s 3000 -pn iocbase/rtc00send -nm 1  -ms 50
new -c dispat_new -n dispat07 -p 80  -o 0 -s 5000 -pn iocbase/sio02write -nm 3  -ms 512
new -c dispat_new -n dispat08 -p 80  -o 0 -s 5000 -pn iocbase/sio03write -nm 3  -ms 512
init -c idma_init
Delay -t 300
init -c sio302_drv
init -c sio681_Drv
init -c iobus_i_init
init -c eioexe_i_init
init -c tc8569_init
init -c tc8521_i_init
init -c a209_i_init
init -c rtp2_drv
task -n rwm_checksum -e rwm_checksum -p 255 -o 2 -s 3000 -m 2
Release -cpu MC
Sync -cpu MC
Exit
