# Startup.cmd script for the fox system rel 2.0 /pe 950601
#
silent
memsize -pool 1300000 -pgm 450000 -cfg 450000 -tx 210000 -sdb 70000
memsize -pool 1880000 -pgm 975000 -cfg 500000 -tx 235000 -sdb 70000
memsize -pool 2380000 -pgm 1475000 -cfg 500000 -tx 235000 -sdb 70000
memsize -pool 3630000 -pgm 2495000 -cfg 600000 -tx 235000 -sdb 200000
memsize -pool 3780000 -pgm 2795000 -cfg 550000 -tx 235000 -sdb 100000
memsize -pool 5000000 -pgm 3795000 -cfg 600000 -tx 235000 -sdb 200000
memsize -pool 6300000 -pgm 5000000 -cfg 600000 -tx 235000 -sdb 300000
eiosetup -cross 60 -unit 12 -symb 310
init -resource base
new -resource base
init -resource sio
config -version 2 -revision 0
# Early elog start
task -slotname elogts -slotid 1 -pri 90 -vwopt 0x1c -stcks 5000 \
-entp elog_main -auto
task  -slotname elog_all -pri 120 -vwopt 0x1c -stcks 5000 \
-entp elog_all -auto
task  -slotname elogtx -pri 90 -vwopt 0x1c -stcks 5000 \
-entp elogtx -auto

synchronize -level task
go -level task
new -resource elog
init -resource eio
init -resource motion
init -resource proc
init -resource cab
init -resource tp


# teachpendant setup iso850 or katakan:

# NOTE ! The Katakana var5 value below must match also the install.cmd

if -var 5 -value 7 -label KATAKAN
teachpendant -device sio7: -type 0 -font B -keyclick 50 -idletime 120 \
-commtimeout 2000 -moverate 100 -idlerate 500
goto -label TASK_START
#KATAKAN
teachpendant -device sio7: -type 0 -font F -keyclick 50 -idletime 120 \
-commtimeout 2000 -moverate 100 -idlerate 500
loadfont -path katakan.tpu
#TASK_START
# task definitions: 

task -path $(SEARCH)hpbin/alarmts  \
-slotname alarmts -slotid 16 -pri 80 -vwopt 0x1c -stcks 5000 \
-entp alarmts -auto

task -path $(SEARCH)hpbin/pstopts \
-slotname pstopts -pri 30 -vwopt 0x1c -stcks 2500 \
-entp pstopts_main -auto -nosync

task -path $(SEARCH)$(HPBIN)/rhaltts \
-slotname rhaltts -pri 30 -vwopt 0x1c -stcks 2500 \
-entp rhaltts_main -auto -nosync

task -path $(SEARCH)hpbin/safevtts \
-slotname safevtts  -slotid 20 -pri 20 -vwopt 0x1c -stcks 10000 \
-entp safevtts -auto

task -path $(SEARCH)hpbin/safcycts  \
-slotname safcycts  -slotid 29 -pri 80 -vwopt 0x1c -stcks 5000 \
-entp safcycts -auto

task -path $(SEARCH)hpbin/sysevtts  \
-slotname sysevtts  -slotid 30 -pri 95 -vwopt 0x1c -stcks 5000 \
-entp sysevtts -auto

task -path $(SEARCH)hpbin/ipolts \
-slotname ipolts -slotid 18 -pri 90 -vwopt 0x1c -stcks 15000 \
-entp ipolts_main -auto

task -path $(SEARCH)hpbin/servots \
-slotname servots -slotid 19 -pri 5 -vwopt 0x1c -stcks 20000 \
-entp servots_main -auto

task -path /projects/foxmot/hpbin/dsp_flts \
-slotname dsp_flts -slotid 28 -pri 6 -vwopt 0x1c -stcks 5000 \
-entp dsp_flts_main -auto

task -path $(SEARCH)hpbin/peventts \
-slotname peventts -slotid 21 -pri 70 -vwopt 0x1c -stcks 10000 \
-entp peventts -auto

task -path $(SEARCH)hpbin/rlcomts \
-slotname rlcomts -slotid 27 -pri 100 -vwopt 0x1c -stcks 8000 \
-entp rlcomts_main -auto

task -path $(SEARCH)hpbin/cabtssm \
-slotname cabts -slotid 17 -pri 100 -vwopt 0x1c -stcks 45000 \
-entp cabts_main -auto

task -path $(SEARCH)$(HPBIN)/wmbts  \
-slotname wmb -slotid 24 -pri 125 -vwopt 0x1c -stcks 3000 \
-entp wmb_main -auto

task -path $(SEARCH)hpbin/wm  \
-slotname wm -slotid 3 -pri 110 -vwopt 0x1c -stcks 6000 \
-entp wm_main -auto

task -path $(SEARCH)hpbin/tpiupts  \
-slotname tpiupts -pri 80 -vwopt 0x1c -stcks 5000 \
-entp tpiupts -auto

task -path $(SEARCH)hpbin/tpits  \
-slotname tpits -slotid 4 -pri 85 -vwopt 0x1c -stcks 5000 \
-entp tpi_main -auto

reconfigure -resource eio
reconfigure -resource sio
new -resource proc

task -path $(SEARCH)hpbin/eiots \
-slotname eiots -pri 70 -vwopt 0x1c -stcks 10000 \
-entp eiots -auto -nosync

synchronize -level task
go -level task

new -resource motion
delay -time 1000
connect_dependings -object SYS_STORED_OBJ_CAB -instance 0 -man 0 -ipm 0 -servo 0 -ipol 0 
include -path ram1disk:option.cmd
new -resource cab

task -path $(SEARCH)$(HPBIN)/spooltss \
-slotname spoolts -slotid 34 -pri 140 -vwopt 0x1c -stcks 3000 \
-entp spool_main  -auto

task -path $(SEARCH)hpbin/him \
-slotname him -slotid 7 -pri 120 -vwopt 0x1c -stcks 8000 \
-entp him_main -auto

task -path $(SEARCH)$(HPBIN)/hixtssm \
-slotname hix -slotid 31 -pri 120 -vwopt 0x1c -stcks 5000 \
-entp hix_main  -auto

task -path $(SEARCH)hpbin/hio \
-slotname hio -slotid 5 -pri 120 -vwopt 0x1c -stcks 10000 \
-entp hio_main -auto

task -path $(SEARCH)hpbin/hictssm \
-slotname hic -slotid 11 -pri 120 -vwopt 0x1c -stcks 10000 \
-entp hic_main -auto

task -path $(SEARCH)hpbin/hijsm \
-slotname hij -slotid 8 -pri 120 -vwopt 0x1c -stcks 6000 \
-entp hij_main -auto

task -path $(SEARCH)hpbin/hpjsm \
-slotname hpjts -slotid 22 -pri 100 -vwopt 0x1c -stcks 5000 \
-entp hpj_main -auto

task -path $(SEARCH)hpbin/hifts \
-slotname hif -slotid 14 -pri 120 -vwopt 0x1c -stcks 45000 \
-entp hif_main  -auto

task -path $(SEARCH)hpbin/histssm \
-slotname his -slotid 12 -pri 120 -vwopt 0x1c -stcks 7000 \
-entp his_main  -auto

task -path $(SEARCH)hpbin/hiatssm \
-slotname hiats -slotid 6 -pri 120 -vwopt 0x1c -stcks 20000 \
-entp hia_main  -auto

task -path $(SEARCH)hpbin/hipts \
-slotname hip -slotid 13 -pri 120 -vwopt 0x1c -stcks 10000 \
-entp hip_main -auto

task -path $(SEARCH)hpbin/rap_sv \
-slotname rap_sv -pri 105 -vwopt 0x1c -stcks 10000 \
-entp rap_sv 

task -path $(SEARCH)hpbin/rapts \
-slotname rapts -pri 110 -vwopt 0x1c -stcks 10000 \
-entp rapts 

task -path $(SEARCH)hpbin/rapts1 \
-slotname rapts1 -pri 50 -vwopt 0x1c -stcks 10000 \
-entp rapts1 

synchronize -level task
elogact
go -level task
tpkey_on

