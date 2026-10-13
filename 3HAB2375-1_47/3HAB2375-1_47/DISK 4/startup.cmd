#
# Property of ABB Robotics Products, Vasteras/Sweden. All rights reserved.
# Copyright 1993.
#
# Startup.cmd script for the S4/S4C system rel 3.0 /JH 970304
#
silent

#S4C_ONLY memsize -pool 500 -pgm 200000 -cfg 100000 -tx 130000 -sdb 70000 -uwm 1000
#S4C_ONLY memsize -pool 1700000 -pgm  500000 -cfg 650000 -tx 300000 -sdb  70000 -uwm 30000
#S4C_ONLY memsize -pool 1900000 -pgm  700000 -cfg 650000 -tx 300000 -sdb  70000 -uwm 30000
#S4C_ONLY memsize -pool 2000000 -pgm  750000 -cfg 750000 -tx 300000 -sdb  70000 -uwm 30000
#S4C_ONLY memsize -pool 2100000 -pgm  850000 -cfg 750000 -tx 300000 -sdb  70000 -uwm 30000
#S4C_ONLY memsize -pool 2300000 -pgm 1050000 -cfg 750000 -tx 300000 -sdb  70000 -uwm 30000
#S4C_ONLY memsize -pool 3000000 -pgm 1750000 -cfg 750000 -tx 300000 -sdb  70000 -uwm 30000
#S4C_ONLY memsize -pool 4000000 -pgm 2750000 -cfg 750000 -tx 300000 -sdb  70000 -uwm 30000
#S4C_ONLY memsize -pool 6350000 -pgm 5000000 -cfg 800000 -tx 300000 -sdb 100000 -uwm 50000
#S4C_ONLY eiosetup -cross 60 -unit 20 -driv 24 -phy 741 -log 550 -symb 592 -pf 128

memsize -pool 500 -pgm 200000 -cfg 100000 -tx 130000 -sdb 70000 -uwm 1000
memsize -pool 1700000 -pgm  550000 -cfg 650000 -tx 300000 -sdb  70000 -uwm 30000
memsize -pool 1900000 -pgm  750000 -cfg 650000 -tx 300000 -sdb  70000 -uwm 30000
memsize -pool 2000000 -pgm  800000 -cfg 700000 -tx 300000 -sdb  70000 -uwm 30000
memsize -pool 2100000 -pgm  900000 -cfg 700000 -tx 300000 -sdb  70000 -uwm 30000
memsize -pool 2300000 -pgm 1100000 -cfg 700000 -tx 300000 -sdb  70000 -uwm 30000
memsize -pool 3000000 -pgm 1800000 -cfg 700000 -tx 300000 -sdb  70000 -uwm 30000
memsize -pool 4000000 -pgm 2800000 -cfg 700000 -tx 300000 -sdb  70000 -uwm 30000
memsize -pool 6300000 -pgm 5000000 -cfg 750000 -tx 300000 -sdb 100000 -uwm 50000
eiosetup -cross 60 -unit 20 -driv 24 -phy 512 -log 295 -symb 337 -pf 128

#S4C_ONLY init -entry gtime_init

init -resource base
new -resource base
init -resource sio
config -version 3 -revision 0
# Early elog start
task -slotname elogts -slotid 1 -pri 90 -vwopt 0x1c -stcks 5000 \
-entp elog_main -auto
task  -slotname elog_all -pri 120 -vwopt 0x1c -stcks 5000 \
-entp elog_all
task  -slotname elogtx -pri 90 -vwopt 0x1c -stcks 5000 \
-entp elogtx -auto

synchronize -level task
go -level task
new -resource elog
init -resource eio
init -resource proc
init -resource motion
init -resource cab
init -resource tp

# teachpendant setup iso-latin or katakan:

if -var 7 -value 1 -label KATAKAN
teachpendant -device sio7: -type 0 -font B -keyclick 50 -idletime 120 \
-commtimeout 2000 -moverate 100 -idlerate 500 -tputimeout 1000
goto -label TASK_START
#KATAKAN
teachpendant -device sio7: -type 0 -font F -keyclick 50 -idletime 120 \
-commtimeout 2000 -moverate 100 -idlerate 500 -tputimeout 1000

#TASK_START
# task definitions: 

task -path $(SEARCH)$(HPBIN)/alarmts  \
-slotname alarmts -slotid 16 -pri 80 -vwopt 0x1c -stcks 5000 \
-entp alarmts -auto

task -path $(SEARCH)$(HPBIN)/pstopts \
-slotname pstopts -pri 30 -vwopt 0x1c -stcks 2500 \
-entp pstopts_main -auto -nosync

task -path $(SEARCH)$($(HPBIN))/rhaltts \
-slotname rhaltts -pri 30 -vwopt 0x1c -stcks 2500 \
-entp rhaltts_main -auto -nosync

#S4C_ONLY task -path $(SEARCH)$(HPBIN)/eioexets \
#S4C_ONLY -slotname eioexets -pri 100 -vwopt 0x1c -stcks 5000 \
#S4C_ONLY -entp eioexets -auto -nosync

new -resource proc
reconfigure -resource sio
reconfigure -resource eio
#S4C_ONLY synchronize -level io_system

task -path $(SEARCH)$(HPBIN)/safevtts \
-slotname safevtts  -slotid 20 -pri 20 -vwopt 0x1c -stcks 10000 \
-entp safevtts -auto

task -path $(SEARCH)$(HPBIN)/safcycts  \
-slotname safcycts  -slotid 29 -pri 80 -vwopt 0x1c -stcks 5000 \
-entp safcycts -auto

task -path $(SEARCH)$(HPBIN)/sysevtts  \
-slotname sysevtts  -slotid 30 -pri 95 -vwopt 0x1c -stcks 5000 \
-entp sysevtts -auto

task -path $(SEARCH)$(HPBIN)/ipolts \
-slotname ipolts -slotid 18 -pri 90 -vwopt 0x1c -stcks 15000 \
-entp ipolts_main -auto

task -path $(SEARCH)$(HPBIN)/servots \
-slotname servots -slotid 19 -pri 5 -vwopt 0x1c -stcks 20000 \
-entp servots_main -auto -slots 2

task -path /projects/foxmot/$(HPBIN)/dsp_flts \
-slotname dsp_flts -slotid 28 -pri 6 -vwopt 0x1c -stcks 5000 \
-entp dsp_flts_main -auto

task -path $(SEARCH)$(HPBIN)/peventts \
-slotname peventts -slotid 21 -pri 70 -vwopt 0x1c -stcks 10000 \
-entp peventts -auto

task -path $(SEARCH)$(HPBIN)/rlcomts \
-slotname rlcomts -slotid 27 -pri 100 -vwopt 0x1c -stcks 8000 \
-entp rlcomts_main -auto

task -path $(SEARCH)$(HPBIN)/cabtssm \
-slotname cabts -slotid 17 -pri 100 -vwopt 0x1c -stcks 45000 \
-entp cabts_main -auto

task -path $(SEARCH)$(HPBIN)/wmbts  \
-slotname wmb -slotid 24 -pri 125 -vwopt 0x1c -stcks 3000 \
-entp wmb_main -auto

task -path $(SEARCH)$(HPBIN)/wm  \
-slotname wm -slotid 3 -pri 110 -vwopt 0x1c -stcks 10000 \
-entp wm_main -auto

task -path $(SEARCH)$(HPBIN)/tpiupts  \
-slotname tpiupts -pri 80 -vwopt 0x1c -stcks 5000 \
-entp tpiupts -auto

task -path $(SEARCH)$(HPBIN)/tpits  \
-slotname tpits -slotid 4 -pri 85 -vwopt 0x1c -stcks 5000 \
-entp tpi_main -auto

synchronize -level task
delay -time 1000
go -level task

task -path $(SEARCH)$(HPBIN)/eiots \
-slotname eiots -pri 70 -vwopt 0x1c -stcks 10000 \
-entp eiots -auto -nosync

fileexist -path ram1disk:option.cmd -label LOAD_CMD
goto -label NEXT_STEP
#LOAD_CMD
include -path ram1disk:option.cmd
#NEXT_STEP

new -resource motion
delay -time 1500
connect_dependings -object SYS_STORED_OBJ_CAB -instance 0 -man 0 -ipm 0 -servo 0 -ipol 0 

# syncronization (setsync) to be used with network systems only
# setsync

task -path $(SEARCH)$(HPBIN)/reiots \
-slotname reiots -slotid 38 -pri 80 -vwopt 0x1c -stcks 5000 \
-entp reiots -auto 

new -resource cab

task -path $(SEARCH)$(HPBIN)/spooltss \
-slotname spoolts -slotid 34 -pri 140 -vwopt 0x1c -stcks 3000 \
-entp spool_main -auto

task -path $(SEARCH)$(HPBIN)/him \
-slotname him -slotid 7 -pri 120 -vwopt 0x1c -stcks 8000 \
-entp him_main -auto

task -path $(SEARCH)$(HPBIN)/hixtssm \
-slotname hix -slotid 31 -pri 120 -vwopt 0x1c -stcks 5000 \
-entp hix_main  -auto

task -path $(SEARCH)$(HPBIN)/hio \
-slotname hio -slotid 5 -pri 120 -vwopt 0x1c -stcks 10000 \
-entp hio_main -auto

task -path $(SEARCH)$(HPBIN)/hictssm \
-slotname hic -slotid 11 -pri 120 -vwopt 0x1c -stcks 15000 \
-entp hic_main -auto

task -path $(SEARCH)$(HPBIN)/hijsm \
-slotname hij -slotid 8 -pri 120 -vwopt 0x1c -stcks 6000 \
-entp hij_main -auto

task -path $(SEARCH)$(HPBIN)/hpjsm \
-slotname hpjts -slotid 22 -pri 99 -vwopt 0x1c -stcks 5000 \
-entp hpj_main -auto

task -path $(SEARCH)$(HPBIN)/hifts \
-slotname hif -slotid 14 -pri 120 -vwopt 0x1c -stcks 50000 \
-entp hif_main  -auto

task -path $(SEARCH)$(HPBIN)/histssm \
-slotname his -slotid 12 -pri 120 -vwopt 0x1c -stcks 9000 \
-entp his_main  -auto

task -path $(SEARCH)$(HPBIN)/hiatssm \
-slotname hiats -slotid 6 -pri 120 -vwopt 0x1c -stcks 20000 \
-entp hia_main  -auto

task -path $(SEARCH)$(HPBIN)/hipts \
-slotname hip -slotid 13 -pri 120 -vwopt 0x1c -stcks 10000 \
-entp hip_main -auto

task -path $(SEARCH)$(HPBIN)/rapsynts \
-slotname rapsynts -pri 125 -vwopt 0x1c -stcks 8000 \
-entp rapsynts_main 

task -path $(SEARCH)$(HPBIN)/rapdatts \
-slotname rapdatts -pri 125 -vwopt 0x1c -stcks 7000 \
-entp rapdatts_main 

task -path $(SEARCH)$(HPBIN)/rapts \
-slotname rapts -pri 130 -vwopt 0x1c -stcks 15000 \
-entp rapts 

task -path $(SEARCH)$(HPBIN)/rapts1 \
-slotname rapts1 -pri 50 -vwopt 0x1c -stcks 5000 \
-entp rapts1 

task -path $(SEARCH)$(HPBIN)/nfsts \
-slotname nfsts -pri 250 -vwopt 0x1c -stcks 8000 \
-entp nfsts_main 

fileexist -path ram1disk:opt_l2.cmd -label LOAD_CMD
goto -label NEXT_STEP
#LOAD_CMD
include -path ram1disk:opt_l2.cmd
#NEXT_STEP
if -var 7 -value 1 -label KATAKAN2
goto -label NOKATAKAN
#KATAKAN2
loadfont -path katakan.tpu
#NOKATAKAN
synchronize -level task
elogact
go -level task
tpkey_on

new -resource tp
