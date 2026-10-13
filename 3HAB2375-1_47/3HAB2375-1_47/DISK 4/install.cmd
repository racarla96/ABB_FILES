#
# Property of ABB Vasteras/Sweden. All rights reserved.
# Copyright 1993.
#
# Install.cmd script for the S4/S4C system rel 3.0 /JH 961120
#
# Install questions
#    var 1  = irb type
#    var 2  = mounting type
#    var 3  = irb variant
#    var 4  = trafo type
#    var 5  = Tp language
#    var 6  = 0 
#    var 7  = TP font (0=ISO-Latin,1=Katakan)
#    var 8  = DC-link type
#    var 9  = -
#    var 10 = temp use.
#
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

init -resource base
new -resource base
init -resource sio
config -version 3 -revision 0
# Early elog start
task -slotname elogts -slotid 1 -pri 90 -vwopt 0x1c -stcks 5000 \
-entp elog_main -auto
task  -slotname elog_all -pri 120 -vwopt 0x1c -stcks 5000 \
-entp elog_all -auto
synchronize -level task
go -level task

init -resource eio
init -resource motion
init -resource proc
init -resource cab
init -resource tp

teachpendant -device sio7: -type 0 -font B -keyclick 50 -idletime 120 \
-commtimeout 2000 -moverate 100 -idlerate 500
registrate -path $BOOTPATH/disc.id

setvar -var 6 -value 0
echo -text "Installation start ..."
echo -text "Select Service/Standard motion param:"
query -text "  Stand                       Service " -var 10 -fk_text

# task definitions: 

task -path $(SEARCH)hpbin/pstopts \
-slotname pstopts -pri 30 -vwopt 0x1c -stcks 2500 \
-entp pstopts_main -auto -nosync

task -path $(SEARCH)$(HPBIN)/rhaltts \
-slotname rhaltts -pri 30 -vwopt 0x1c -stcks 2500 \
-entp rhaltts_main -auto -nosync

task -path $(SEARCH)hpbin/cabtssm \
-slotname cabts -slotid 17 -pri 100 -vwopt 0x1c -stcks 10000 \
-entp cabts_main -auto

#CONFIG_LOAD
# system defined config files
echo -text "Installing system config files"
config -filename  $BOOTPATH/sys.cfg -domain SYS -internal
#S4C_ONLY config -filename  $BOOTPATH/eios4c.cfg -domain EIO -internal
#S4C_ONLY config -filename  $BOOTPATH/eio331.cfg -domain EIO -internal
config -filename  $BOOTPATH/eio.cfg -domain EIO -internal
if -var 10 -value 50 -label ADVANCE_MOCPAR
config -filename  $BOOTPATH/moc_mmc.cfg -domain MOC -internal
goto -label CONFIG_NEXT
#ADVANCE_MOCPAR
config -filename  $BOOTPATH/moc_mmcs.cfg -domain MOC -internal
#CONFIG_NEXT
config -filename  $BOOTPATH/sys_mmc.cfg -domain SYS -internal
config -filename  $BOOTPATH/com_mmc.cfg -domain SIO -internal
config -filename  $BOOTPATH/eio_mmc.cfg -domain MMC -internal

config -filename  $BOOTPATH/pgmbtn.cfg -domain MMC  -internal
config -filename  $BOOTPATH/rlmset.cfg -domain MMC  -internal
config -filename  $BOOTPATH/rlmove.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlmsys.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlexe.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlcom.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlio.cfg -domain MMC -internal
config -filename  $BOOTPATH/rltrap.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlmmec.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlsys.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlload.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlmsrc.cfg -domain MMC -internal
config -filename  $BOOTPATH/rltrig.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlraps.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlmath.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlsset.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlstr.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlcure.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlwz.cfg -domain MMC -internal
config -filename  $BOOTPATH/rltool.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlsym.cfg -domain MMC -internal
config -filename  $BOOTPATH/rlbit.cfg -domain MMC -internal

config -filename  $BOOTPATH/rlbasic.cfg -domain SYS -internal

config -filename  $BOOTPATH/hip.cfg -domain MMC -internal
config -filename  $BOOTPATH/hiref.cfg -domain MMC -internal
config -filename  $BOOTPATH/hifi.cfg -domain MMC -internal
config -filename  $BOOTPATH/datatype.cfg -domain MMC -internal
config -filename  $BOOTPATH/hia.cfg -domain MMC
config -filename  $BOOTPATH/hic.cfg -domain MMC
config -filename  $BOOTPATH/hij.cfg -domain MMC
config -filename  $BOOTPATH/mmc.cfg -domain MMC
config -filename  $BOOTPATH/wm.cfg -domain MMC
config -filename  $BOOTPATH/his.cfg -domain MMC
# Site dependent default config files
config -filename  $BOOTPATH/usrsys.cfg -domain SYS
config -filename  $BOOTPATH/usrmmc.cfg -domain MMC
#S4C_ONLY config -filename  $BOOTPATH/com_int.cfg -domain SIO -internal
config -filename  $BOOTPATH/com_int.cfg -domain SIO
config -filename  $BOOTPATH/com_ext.cfg -domain SIO

#S4C_ONLY task -path ./hp100bin/eioexets \
#S4C_ONLY -slotname eioexets -pri 100 -vwopt 0x1c -stcks 5000 \
#S4C_ONLY -entp eioexets -auto -nosync

new -resource proc
reconfigure -resource sio
reconfigure -resource eio

#
#RAPID instruction texts
#
echo -text "Installing RAPID"
text -filename  $BOOTPATH/pgmbtn.eng -package 0

text -filename  $BOOTPATH/rlmset.eng -package 0
text -filename  $BOOTPATH/rlmove.eng -package 0
text -filename  $BOOTPATH/rlmsys.eng -package 0
text -filename  $BOOTPATH/rlexe.eng -package 0
text -filename  $BOOTPATH/rlcom.eng -package 0
text -filename  $BOOTPATH/rlio.eng -package 0
text -filename  $BOOTPATH/rltrap.eng -package 0
text -filename  $BOOTPATH/rlmmec.eng -package 0
text -filename  $BOOTPATH/rlsys.eng -package 0
text -filename  $BOOTPATH/rlload.eng -package 0
text -filename  $BOOTPATH/rlcure.eng -package 0
text -filename  $BOOTPATH/rlmsrc.eng -package 0
text -filename  $BOOTPATH/rltrig.eng -package 0
text -filename  $BOOTPATH/rlraps.eng -package 0
text -filename  $BOOTPATH/rlmath.eng -package 0
text -filename  $BOOTPATH/rlsset.eng -package 0
text -filename  $BOOTPATH/rlstr.eng -package 0
text -filename  $BOOTPATH/rlwz.eng -package 0
text -filename  $BOOTPATH/rltool.eng -package 0
text -filename  $BOOTPATH/rlsym.eng -package 0
text -filename  $BOOTPATH/rlbit.eng -package 0

#S4C_ONLY synchronize -level io_system
synchronize -level task
go -level task

echo -text "Installing ramdisk files"

fileexist -path ram1disk:option.cmd -label CLEANUP_1
goto -label NEXT_STEP
#CLEANUP_1
delete -path ram1disk:option.cmd
#NEXT_STEP
fileexist -path ram1disk:opt_l2.cmd -label CLEANUP_2
goto -label NEXT_STEP
#CLEANUP_2
delete -path ram1disk:opt_l2.cmd
#NEXT_STEP

#S4C_ONLY copy -from $BOOTPATH/dspld.bin -to ram1disk:dspld.bin
#S4C_ONLY copy -from $BOOTPATH/droot.ini -to ram1disk:droot.ini
copy -from $BOOTPATH/apgm.lod -to ram1disk:apgm.lod
copy -from $BOOTPATH/adpgm.lod -to ram1disk:adpgm.lod
copy -from $BOOTPATH/katakan.tpu -to ram1disk:katakan.tpu
copy -from $BOOTPATH/startup.cmd -to ram1disk:startup.cmd
copy -from $BOOTPATH/base.sys -to ram1disk:base.sys
copy -from $BOOTPATH/user.sys -to ram1disk:user.sys
copy -from $BOOTPATH/param.chk -to ram1disk:param.chk
echo -text "Teach Pendant Language"
echo -text "0 - English"
echo -text "1 - Swedish"
echo -text "2 - German"
echo -text "3 - Francais"
echo -text "4 - Spanish"
echo -text "5 - Portuguese"
echo -text "6 - Danish"
echo -text "7 - Italian"
echo -text "8 - Dutch"
echo -text "9 - Japanese (Katakana)"
query -text "Select Teach Pendant Language:" -var 5 
echo -text " "
if -var 5 -value 0 -label ENGLISH
if -var 5 -value 1 -label SWEDISH
if -var 5 -value 2 -label GERMAN
if -var 5 -value 3 -label FRENCH
if -var 5 -value 4 -label SPANISH
if -var 5 -value 5 -label PORTUGUESE
if -var 5 -value 6 -label DANISH
if -var 5 -value 7 -label ITALIAN
if -var 5 -value 8 -label DUTCH
if -var 5 -value 9 -label JAPANESE
goto -label INST_LANG_FIRST_DISC
#ENGLISH
echo -text "Installing English text files"
setstr -strvar $LANG -value "eng"
setstr -strvar $TXTDIR -value "eng"
goto -label INST_LANG_FIRST_DISC
#SWEDISH
echo -text "Installing Swedish text files"
setstr -strvar $LANG -value "swe"
setstr -strvar $TXTDIR -value "swe"
goto -label INST_LANG_FIRST_DISC
#GERMAN
echo -text "Installing German text files"
setstr -strvar $LANG -value "ger"
setstr -strvar $TXTDIR -value "ger"
goto -label INST_LANG_FIRST_DISC
#FRENCH
echo -text "Installing French text files"
setstr -strvar $LANG -value "fra"
setstr -strvar $TXTDIR -value "fra"
goto -label INST_LANG_FIRST_DISC
#SPANISH
echo -text "Installing Spanish text files"
setstr -strvar $LANG -value "spa"
setstr -strvar $TXTDIR -value "spa"
goto -label INST_LANG_FIRST_DISC
#PORTUGUESE
echo -text "Installing Portuguese text files"
setstr -strvar $LANG -value "por"
setstr -strvar $TXTDIR -value "por"
goto -label INST_LANG_SECOND_DISC
#DANISH
echo -text "Installing Danish text files"
setstr -strvar $LANG -value "dan"
setstr -strvar $TXTDIR -value "dan"
goto -label INST_LANG_SECOND_DISC
#ITALIAN
echo -text "Installing Italian text files"
setstr -strvar $LANG -value "ita"
setstr -strvar $TXTDIR -value "ita"
goto -label INST_LANG_SECOND_DISC
#DUTCH
echo -text "Installing Dutch text files"
setstr -strvar $LANG -value "dut"
setstr -strvar $TXTDIR -value "dut"
goto -label INST_LANG_SECOND_DISC
#FINNISH
echo -text "Installing Finnish text files"
setstr -strvar $LANG -value "fin"
setstr -strvar $TXTDIR -value "fin"
goto -label INST_LANG_SECOND_DISC
#JAPANESE
echo -text "Installing Japanese text files"
setstr -strvar $LANG -value "jap"
setstr -strvar $TXTDIR -value "jap"
#load Katakana fonts
setvar -var 7 -value 1
goto -label INST_LANG_SECOND_DISC

#INST_LANG_FIRST_DISC
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert TP text disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/txteng/hi.eng -label LOAD_TEXT
echo -text "This is not a correct TP text disk!"
echo -text "Insert TP text disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/txteng/hi.eng -label LOAD_TEXT
echo -text "This is not a correct TP text disk!"
goto -label END_LABEL

#INST_LANG_SECOND_DISC
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert TP text disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/txteng/hi.eng -label LOAD_TEXT
echo -text "This is not a correct TP text disk!"
echo -text "Insert TP text disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/txteng/hi.eng -label LOAD_TEXT
echo -text "This is not a correct TP text disk!"
goto -label END_LABEL

#LOAD_TEXT
include -path $BOOTPATH/install.cmd

# IRB config files
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert IRB disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/install.cmd -label LOAD_MOC
echo -text "This is not a correct IRB disk!"
echo -text "Insert IRB disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
include -path $BOOTPATH/install.cmd
#NEXT_STEP
#Boot external options
install -resource Function -name "BAR"
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Any Option disk to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
setstr -strvar $BOOTPATH -value flp1:
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path $BOOTPATH/disc.id -label LOAD_OPT
goto -label NEXT_STEP
#LOAD_OPT
registrate -path $BOOTPATH/disc.id
include -path $BOOTPATH/install.cmd
#NEXT_STEP
echo -text "Installing RAPID instruction sets"
new -resource cab
delay -time 4000
# Make System Warmstart (use Startup.cmd)
restart
#END_LABEL
echo -text "Error during installation !"
echo -text "Please retry to install the system."
