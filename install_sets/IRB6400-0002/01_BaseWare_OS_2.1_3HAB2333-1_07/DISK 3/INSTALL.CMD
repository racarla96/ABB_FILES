# Install.cmd script for the fox system rel 2.1 /pe 960117
#
# Install questions
#    var 1  = irb type
#    var 2  = mounting type
#    var 3  = irb variant
#    var 5  = Tp language
#    var 6  = RAPID language
#    var 7  = TP font (0=ISO-Latin,1=Katakan)
#    var 9  = -
#    var 10 = temp use.
#
memsize -pool 500 -pgm 200000 -cfg 100000 -tx 130000 -sdb 70000
memsize -pool 2060000 -pgm 1000000 -cfg 600000 -tx 250000 -sdb 70000 -uwm 50000
memsize -pool 3060000 -pgm 2000000 -cfg 600000 -tx 250000 -sdb 70000 -uwm 50000
memsize -pool 4060000 -pgm 3000000 -cfg 600000 -tx 250000 -sdb 70000 -uwm 50000
memsize -pool 6500000 -pgm 5000000 -cfg 700000 -tx 300000 -sdb 300000 -uwm 100000
eiosetup -cross 60 -driv 15 -unit 12
init -resource base
new -resource base
init -resource sio
config -version 2 -revision 0
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
registrate -path flp1:disc.id

setvar -var 6 -value 0
echo -text "Installation start ..."
echo -text "Select Service/Standard motion param:"
query -text "  Stand                       Service " -var 10 -fk_text

# task definitions: 

task -path $(SEARCH)hpbin/cabtssm \
-slotname cabts -slotid 17 -pri 100 -vwopt 0x1c -stcks 10000 \
-entp cabts_main -auto

#CONFIG_LOAD
# system defined config files
echo -text "Installing system config files"
config -filename  flp1:sys.cfg -domain SYS -internal
config -filename  flp1:eio.cfg -domain EIO -internal
if -var 10 -value 50 -label ADVANCE_MOCPAR
config -filename  flp1:moc_mmc.cfg -domain MOC -internal
goto -label CONFIG_NEXT
#ADVANCE_MOCPAR
config -filename  flp1:moc_mmcs.cfg -domain MOC -internal
#CONFIG_NEXT
config -filename  flp1:sys_mmc.cfg -domain SYS -internal
config -filename  flp1:com_mmc.cfg -domain SIO -internal
config -filename  flp1:eio_mmc.cfg -domain EIO -internal

config -filename  flp1:pgmbtn.cfg -domain MMC  -internal
config -filename  flp1:rlmset.cfg -domain MMC  -internal
config -filename  flp1:rlmove.cfg -domain MMC -internal
config -filename  flp1:rlmsys.cfg -domain MMC -internal
config -filename  flp1:rlexe.cfg -domain MMC -internal
config -filename  flp1:rlcom.cfg -domain MMC -internal
config -filename  flp1:rlio.cfg -domain MMC -internal
config -filename  flp1:rltrap.cfg -domain MMC -internal
config -filename  flp1:rlmmec.cfg -domain MMC -internal
config -filename  flp1:rlsys.cfg -domain MMC -internal
config -filename  flp1:rlload.cfg -domain MMC -internal
config -filename  flp1:rlmsrc.cfg -domain MMC -internal
config -filename  flp1:rltrig.cfg -domain MMC -internal
config -filename  flp1:rlraps.cfg -domain MMC -internal
config -filename  flp1:rlmath.cfg -domain MMC -internal
config -filename  flp1:rlsset.cfg -domain MMC -internal
config -filename  flp1:rlstr.cfg -domain MMC -internal
config -filename  flp1:rlcure.cfg -domain MMC -internal
config -filename  flp1:rlbasic.cfg -domain SYS -internal

config -filename  flp1:hip.cfg -domain MMC -internal
config -filename  flp1:hiref.cfg -domain MMC -internal
config -filename  flp1:hifi.cfg -domain MMC -internal
config -filename  flp1:datatype.cfg -domain MMC -internal
config -filename  flp1:hia.cfg -domain MMC
config -filename  flp1:hic.cfg -domain MMC
config -filename  flp1:mmc.cfg -domain MMC
config -filename  flp1:wm.cfg -domain MMC
# Site dependent default config files
config -filename  flp1:usrsys.cfg -domain SYS
config -filename  flp1:usrmmc.cfg -domain MMC 
config -filename  flp1:com_ext.cfg -domain SIO
#
#RAPID instruction texts
#
echo -text "Installing RAPID"
text -filename  flp1:pgmbtn.eng -package 0
text -filename  flp1:rlmset.eng -package 0
text -filename  flp1:rlmove.eng -package 0
text -filename  flp1:rlmsys.eng -package 0
text -filename  flp1:rlexe.eng -package 0
text -filename  flp1:rlcom.eng -package 0
text -filename  flp1:rlio.eng -package 0
text -filename  flp1:rltrap.eng -package 0
text -filename  flp1:rlmmec.eng -package 0
text -filename  flp1:rlsys.eng -package 0
text -filename  flp1:rlload.eng -package 0
text -filename  flp1:rlcure.eng -package 0
text -filename  flp1:rlmsrc.eng -package 0
text -filename  flp1:rltrig.eng -package 0
text -filename  flp1:rlraps.eng -package 0
text -filename  flp1:rlmath.eng -package 0
text -filename  flp1:rlsset.eng -package 0
text -filename  flp1:rlstr.eng -package 0

new -resource proc

reconfigure -resource sio
reconfigure -resource eio

synchronize -level task
go -level task

echo -text "Installing ramdisk files"
copy -from flp1:apgm.lod -to ram1disk:apgm.lod
copy -from flp1:adpgm.lod -to ram1disk:adpgm.lod
copy -from flp1:katakan.tpu -to ram1disk:katakan.tpu
copy -from flp1:startup.cmd -to ram1disk:startup.cmd
copy -from flp1:base.sys -to ram1disk:base.sys
copy -from flp1:user.sys -to ram1disk:user.sys
copy -from flp1:moc.chk -to ram1disk:param.chk

echo -text "Teach Pendant Language"
echo -text "0 - English"
echo -text "1 - Swedish"
echo -text "2 - German"
echo -text "3 - Francais"
echo -text "4 - Spanish"
echo -text "5 - Italian"
echo -text "6 - Dutch"
echo -text "7 - Japanese (Katakana)"
echo -text "8 - Czech"
query -text "Select Teach Pendant Language:" -var 5 
echo -text " "
if -var 5 -value 0 -label ENGLISH
if -var 5 -value 1 -label SWEDISH
if -var 5 -value 2 -label GERMAN
if -var 5 -value 3 -label FRENCH
if -var 5 -value 4 -label SPANISH
if -var 5 -value 5 -label ITALIAN
if -var 5 -value 6 -label DUTCH
if -var 5 -value 7 -label JAPANESE
if -var 5 -value 8 -label CZECH
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
#ITALIAN
echo -text "Installing Italian text files"
setstr -strvar $LANG -value "ita"
setstr -strvar $TXTDIR -value "ita"
goto -label INST_LANG_FIRST_DISC
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
#CZECH
echo -text "Installing Czech text files"
setstr -strvar $LANG -value "czr"
setstr -strvar $TXTDIR -value "czr"
goto -label INST_LANG_SECOND_DISC
#INST_LANG_FIRST_DISC
echo -text " "
echo -text "Insert TP text disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:txteng/hi.eng -label LOAD_TEXT
echo -text "This is not a correct TP text disk!"
echo -text "Insert TP text disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
goto -label LOAD_TEXT
#INST_LANG_SECOND_DISC
echo -text " "
echo -text "Insert TP text disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:txteng/hi.eng -label LOAD_TEXT
echo -text "This is not a correct TP text disk!"
echo -text "Insert TP text disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_TEXT
include -path flp1:install.cmd
# IRB config files
echo -text " "
echo -text "Insert IRB disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:irbcfg -label LOAD_MOC
echo -text "This is not a correct IRB disk!"
echo -text "Insert IRB disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
include -path flp1:install.cmd
#NEXT_STEP
echo -text " "
echo -text "Any Option disk to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path flp1:disc.id
include -path flp1:install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path flp1:disc.id
include -path flp1:install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path flp1:disc.id
include -path flp1:install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path flp1:disc.id
include -path flp1:install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path flp1:disc.id
include -path flp1:install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:disc.id -label LOAD_OPT
goto -label XXXWARE
#LOAD_OPT
registrate -path flp1:disc.id
include -path flp1:install.cmd
echo -text " "
echo -text "More Option disks to install?"
query -text "                          NO     YES  " -var 10 -fk_text
if -var 10 -value 50 -label XXXWARE
goto -label NEXT_STEP
#XXXWARE
echo -text " "
echo -text "Insert Option boot disk and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:disc.id -label LOAD_OPT
goto -label NEXT_STEP
#LOAD_OPT
registrate -path flp1:disc.id
include -path flp1:install.cmd
#NEXT_STEP
echo -text "Installing RAPID instruction sets"
new -resource cab
# Make System Warmstart (use Startup.cmd)
restart
#END_LABEL
echo -text "Error during installation !"
echo -text "Please retry to install the system."
