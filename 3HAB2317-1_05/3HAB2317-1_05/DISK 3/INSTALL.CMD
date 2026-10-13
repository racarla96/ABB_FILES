# Install.cmd script for the fox system rel 2.0 /pe 950601
#
memsize -pool 1300000 -pgm 450000 -cfg 450000 -tx 210000 -sdb 70000
memsize -pool 1880000 -pgm 980000 -cfg 500000 -tx 230000 -sdb 70000
memsize -pool 2380000 -pgm 1480000 -cfg 500000 -tx 230000 -sdb 70000
memsize -pool 3630000 -pgm 2500000 -cfg 600000 -tx 230000 -sdb 200000
memsize -pool 3780000 -pgm 2800000 -cfg 550000 -tx 230000 -sdb 100000
memsize -pool 5000000 -pgm 3800000 -cfg 600000 -tx 300000 -sdb 200000
memsize -pool 6300000 -pgm 5000000 -cfg 600000 -tx 300000 -sdb 300000
eiosetup -cross 60 -unit 12
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

# Install questions
#    var 1  = irb type
#    var 2  = mounting type
#    var 3  = irb variant
#    var 5  = Tp language
#    var 6  = RAPID language
#    var 7  = motor type (E/S)
#    var 9  = Std/Ext Motion param MMC.
#    var 10 = temp use.

setvar -var 6 -value 0
echo -text "Installation start ..."
echo -text "Select IRB type to install :"
query -text  "1400     2400    3400    4400     SCAN" \
      -text2 "6400     6400C                    SCAN" -var 1 -fk_text

if -var 1 -value 10 -label TYPE_1400
if -var 1 -value 20 -label MOUNTING_LABLE
if -var 1 -value 30 -label TYPE_3400
if -var 1 -value 40 -label TYPE_4400
if -var 1 -value 110 -label TYPE_6400
if -var 1 -value 120 -label TYPE_PAL
goto -label END_LABEL
#TYPE_1400
echo -text "Select IRB1400 model :"
query -text "  base   hanging                     " -var 3 -fk_text
if -var 3 -value 10 -label TEXT_LABEL
if -var 3 -value 20 -label MOUNTING_LABLE
goto -label END_LABEL
#TYPE_3400
echo -text "Select IRB3400 model :"
query -text "  base foundry 2,5-10                " -var 3 -fk_text
if -var 3 -value 10 -label TEXT_LABEL
if -var 3 -value 20 -label TEXT_LABEL
if -var 3 -value 30 -label TEXT_LABEL
goto -label END_LABEL
#TYPE_4400
echo -text "Select IRB4400 model :"
query -text "1,95-45 1,95-60                      " -var 3 -fk_text
if -var 3 -value 10 -label TEXT_LABEL
if -var 3 -value 20 -label TEXT_LABEL
goto -label END_LABEL
#TYPE_6400
echo -text "Select IRB6400 model :"
query -text  "2,25-75 2,4-120 2,4-150 2,8-120   SCAN" \
      -text2 "S2,9-120 3,0-75                   SCAN" -var 3 -fk_text
if -var 3 -value 10 -label M94A_ELMO_6400
if -var 3 -value 20 -label M94A_M96_MOTOR_6400
if -var 3 -value 30 -label M94A_M96_MOTOR_6400
if -var 3 -value 40 -label M94A_M96_MOTOR_6400
if -var 3 -value 110 -label M94A_MOTOR_6400
if -var 3 -value 120 -label M94A_MOTOR_6400
goto -label END_LABEL
#TYPE_PAL
echo -text "Select IRB6400C model :"
query -text "  120     150                        " -var 3 -fk_text
if -var 3 -value 10 -label TEXT_LABEL
if -var 3 -value 20 -label TEXT_LABEL
goto -label END_LABEL
#M94A_MOTOR_6400
query -text " Elmo  Siemens                     " -var 7 -fk_text
if -var 7 -value 10 -label TEXT_LABEL
if -var 7 -value 20 -label TEXT_LABEL
goto -label END_LABEL
#M94A_M96_MOTOR_6400
echo -text "Select IRB6400 motor type alternative :"
query -text " Elmo  Siemens   M96               " -var 7 -fk_text
if -var 7 -value 10 -label TEXT_LABEL
if -var 7 -value 20 -label TEXT_LABEL
if -var 7 -value 30 -label TEXT_LABEL
goto -label END_LABEL
#M94A_ELMO_6400
setvar -var 7 -value 10
goto -label TEXT_LABEL
#M96_SIEMENS_6400
setvar -var 7 -value 30
goto -label TEXT_LABEL
#MOUNTING_LABLE
echo -text "Select mounting of the IRB:"
query -text " Floor  Ceiling                       " -var 2 -fk_text
if -var 2 -value 10 -label TEXT_LABEL
if -var 2 -value 20 -label TEXT_LABEL
goto -label END_LABEL
#TEXT_LABEL
echo -text "Teach Pendant Language"
echo -text "0 - English"
echo -text "1 - Swedish"
echo -text "2 - German"
echo -text "3 - Francais"
echo -text "4 - Spanish"
echo -text "5 - Italian"
echo -text "6 - Dutch"
echo -text "7 - Japanese (Katakana)"
query -text "Select Teach Pendant Language:" -var 5 
echo -text "Select Service/Standard motion param:"
query -text "  Stand                       Service " -var 9 -fk_text

# task definitions: 

task -path $(SEARCH)hpbin/cabtssm \
-slotname cabts -slotid 17 -pri 100 -vwopt 0x1c -stcks 10000 \
-entp cabts_main -auto

#CONFIG_LOAD
# system defined config files
echo -text "Installing system config files"
config -filename  flp1:sys.cfg -domain SYS -internal
config -filename  flp1:eio.cfg -domain EIO -internal
if -var 9 -value 50 -label ADVANCE_MOCPAR
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
echo -text "Installing English RAPID"
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
text -filename  flp1:rlcure.eng -package 0
text -filename  flp1:rlmsrc.eng -package 0
text -filename  flp1:rltrig.eng -package 0
text -filename  flp1:rlraps.eng -package 0
text -filename  flp1:rlmath.eng -package 0
text -filename  flp1:rlsset.eng -package 0
text -filename  flp1:rlstr.eng -package 0

reconfigure -resource eio
reconfigure -resource sio
new -resource proc

synchronize -level task
go -level task

echo -text "Installing ramdisk files"
#mkdir -path ram1disk:system
copy -from flp1:apgm.lod -to ram1disk:apgm.lod
copy -from flp1:adpgm.lod -to ram1disk:adpgm.lod
copy -from flp1:katakan.tpu -to ram1disk:katakan.tpu
copy -from flp1:startup.cmd -to ram1disk:startup.cmd
copy -from flp1:base.sys -to ram1disk:base.sys
copy -from flp1:user.sys -to ram1disk:user.sys
copy -from flp1:moc.chk -to ram1disk:param.chk

echo -text " "
echo -text "Insert IRB disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:txteng/hi.eng -label LOAD_TEXT
echo -text "This is not a correct IRB disk!"
echo -text "Insert IRB disk(1) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_TEXT
echo -text " "
if -var 5 -value 0 -label ENGLISH
if -var 5 -value 1 -label SWEDISH
if -var 5 -value 2 -label GERMAN
if -var 5 -value 3 -label FRENCH
if -var 5 -value 4 -label SPANISH
if -var 5 -value 5 -label ITALIAN
if -var 5 -value 6 -label DUTCH
if -var 5 -value 7 -label JAPANESE
goto -label INST_LANG
#ENGLISH
echo -text "Installing English text files"
setstr -strvar $LANG -value "eng"
setstr -strvar $TXTDIR -value "eng"
goto -label INST_LANG
#SWEDISH
echo -text "Installing Swedish text files"
setstr -strvar $LANG -value "swe"
setstr -strvar $TXTDIR -value "swe"
goto -label INST_LANG
#GERMAN
echo -text "Installing German text files"
setstr -strvar $LANG -value "ger"
setstr -strvar $TXTDIR -value "ger"
goto -label INST_LANG
#FRENCH
echo -text "Installing French text files"
setstr -strvar $LANG -value "fra"
setstr -strvar $TXTDIR -value "fra"
goto -label INST_LANG
#SPANISH
echo -text "Installing Spanish text files"
setstr -strvar $LANG -value "spa"
setstr -strvar $TXTDIR -value "spa"
goto -label INST_LANG
#ITALIAN
echo -text "Installing Italian text files"
setstr -strvar $LANG -value "ita"
setstr -strvar $TXTDIR -value "ita"
goto -label INST_LANG
#DUTCH
echo -text "Installing Dutch text files"
setstr -strvar $LANG -value "dut"
setstr -strvar $TXTDIR -value "dut"
goto -label INST_LANG
#FINNISH
echo -text "Installing Finnish text files"
setstr -strvar $LANG -value "fin"
setstr -strvar $TXTDIR -value "fin"
goto -label INST_LANG
#JAPANESE
echo -text "Installing Japanese text files"
setstr -strvar $LANG -value "jap"
setstr -strvar $TXTDIR -value "jap"
goto -label INST_LANG
#INST_LANG
fileexist -path flp1:txt$TXTDIR/hi.$LANG -label LOAD_TEXT
echo -text "Language not available!"
echo -text "Installing English text files"
setstr -strvar $LANG -value "eng"
setstr -strvar $TXTDIR -value "eng"
#LOAD_TEXT
text -filename flp1:txt$TXTDIR/fox.$LANG -package 0
text -filename flp1:txt$TXTDIR/hi.$LANG -package 0
text -filename flp1:txt$TXTDIR/him.$LANG -package 0
text -filename flp1:txt$TXTDIR/hix.$LANG -package 0
text -filename flp1:txt$TXTDIR/hif.$LANG -package 0
text -filename flp1:txt$TXTDIR/hio.$LANG -package 0
text -filename flp1:txt$TXTDIR/hic.$LANG -package 0
text -filename flp1:txt$TXTDIR/hij.$LANG -package 0
text -filename flp1:txt$TXTDIR/his.$LANG -package 0
text -filename flp1:txt$TXTDIR/hia.$LANG -package 0
text -filename flp1:txt$TXTDIR/hiaerr.$LANG -package 0
text -filename flp1:txt$TXTDIR/hiaobjid.$LANG -package 0
text -filename flp1:txt$TXTDIR/hiasea.$LANG -package 0
text -filename flp1:txt$TXTDIR/hip.$LANG -package 0
text -filename flp1:txt$TXTDIR/hiref.$LANG -package 0
#
#Configuration edit texts
#
text -filename flp1:txt$TXTDIR/eio_mmc.$LANG -package 0
text -filename flp1:txt$TXTDIR/mmc_cfg.$LANG -package 0
text -filename flp1:txt$TXTDIR/moc_cfg.$LANG -package 0
text -filename flp1:txt$TXTDIR/com_mmc.$LANG -package 0
text -filename flp1:txt$TXTDIR/sys_mmc.$LANG -package 0
#
#elog texts
#
text -filename flp1:txt$TXTDIR/usr_elog.$LANG -package 0
text -filename flp1:txt$TXTDIR/mmc_elog.$LANG -package 0
text -filename flp1:txt$TXTDIR/sys_elog.$LANG -package 0
text -filename flp1:txt$TXTDIR/opr_elog.$LANG -package 0
text -filename flp1:txt$TXTDIR/arl_elog.$LANG -package 0
text -filename flp1:txt$TXTDIR/io_elog.$LANG -package 0
text -filename flp1:txt$TXTDIR/hw_elog.$LANG -package 0
text -filename flp1:txt$TXTDIR/moc_elog.$LANG -package 0

echo -text " "
# IRB config files

if -var 1 -value 10 -label IRB1400_BASE
if -var 1 -value 20 -label IRB2400_BASE
if -var 1 -value 30 -label IRB3400_BASE
if -var 1 -value 40 -label IRB4400_BASE
if -var 1 -value 110 -label IRB6400_BASE
if -var 1 -value 120 -label IRBPAL_BASE
goto -label END_LABEL
#IRB1400_BASE
if -var 3 -value 10 -label IRB1400_FLOOR
if -var 2 -value 10 -label IRB1400_HANGING_FLOOR
if -var 2 -value 20 -label IRB1400_HANGING_CEILING
goto -label END_LABEL
#IRB2400_BASE
if -var 2 -value 10 -label IRB2400_FLOOR
if -var 2 -value 20 -label IRB2400_CEILING
goto -label END_LABEL
#IRB3400_BASE
if -var 3 -value 10 -label IRB3400_FLOOR
if -var 3 -value 20 -label IRB3400_FOUNDRY
if -var 3 -value 30 -label IRB3400_2.5
goto -label END_LABEL
#IRB4400_BASE
if -var 3 -value 10 -label IRB4400_45
if -var 3 -value 20 -label IRB4400_60
goto -label END_LABEL
#IRB6400_BASE
if -var 7 -value 10 -label IRB6400_E_M94A
if -var 7 -value 20 -label IRB6400_ES_M94A
if -var 7 -value 30 -label IRB6400_S_M96
goto -label END_LABEL
#IRBPAL_BASE
if -var 3 -value 10 -label IRBPAL_120
if -var 3 -value 20 -label IRBPAL_150
goto -label END_LABEL
#IRB6400_E_M94A
if -var 3 -value 10 -label IRB6400_225_75
if -var 3 -value 20 -label IRB6400_24_120
if -var 3 -value 30 -label IRB6400_24_150
if -var 3 -value 40 -label IRB6400_28_120
if -var 3 -value 110 -label IRB6400_29_120
if -var 3 -value 120 -label IRB6400_30_75
goto -label END_LABEL
#IRB6400_ES_M94A
if -var 3 -value 20 -label IRBS6400_24_120
if -var 3 -value 30 -label IRBS6400_24_150
if -var 3 -value 40 -label IRBS6400_28_120
if -var 3 -value 110 -label IRBS6400_29_120
if -var 3 -value 120 -label IRBS6400_30_75
goto -label END_LABEL
#IRB6400_S_M96
if -var 3 -value 20 -label IRBP6400_24_120
if -var 3 -value 30 -label IRBP6400_24_150
if -var 3 -value 40 -label IRBP6400_28_120
goto -label END_LABEL
#IRB1400_FLOOR
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m14fs.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 1400 base config files"
install -resource Function -name "IRB" -descr "1400 floor"
config -filename  flp1:/irbcfg/m14fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400_FLOOR
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m24fs.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 2400 floor config files"
install -resource Function -name "IRB" -descr "2400 floor"
config -filename  flp1:/irbcfg/m24fs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m24fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB3400_FLOOR
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m34fs.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 3400 floor config files"
install -resource Function -name "IRB" -descr "3400 floor"
config -filename  flp1:/irbcfg/m34fs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m34fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m34fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB3400_FOUNDRY
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m34fofs.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 3400 foundry config files"
install -resource Function -name "IRB" -descr "3400 foundry"
config -filename  flp1:/irbcfg/m34fofs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m34fofi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m34fofe.cfg -domain MOC
goto -label NEXT_STEP
#IRB3400_2.5
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m3425fs.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 3400/2,5-10 config files"
install -resource Function -name "IRB" -descr "3400/2,5-10"
config -filename  flp1:/irbcfg/m3425fs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m3425fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m3425fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB4400_45
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m441845s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 4400/1,95-45 config files"
install -resource Function -name "IRB" -descr "4400/1,95-45"
config -filename  flp1:/irbcfg/m441845s.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m441845i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m441845e.cfg -domain MOC
goto -label NEXT_STEP
#IRB4400_60
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m441860s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 4400/1,95-60 config files"
install -resource Function -name "IRB" -descr "4400/1,95-60"
config -filename  flp1:/irbcfg/m441860s.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m441860i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m441860e.cfg -domain MOC
goto -label NEXT_STEP
#IRB1400_HANGING_CEILING
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m14ss.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 1400 hanging ceiling"
install -resource Function -name "IRB" -descr "1400 ceiling"
config -filename  flp1:/irbcfg/m14ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14se.cfg -domain MOC
goto -label NEXT_STEP
#IRB1400_HANGING_FLOOR
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m14sis.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 1400 hanging floor"
install -resource Function -name "IRB" -descr "1400 ceiling"
config -filename  flp1:/irbcfg/m14sis.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14sii.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14sie.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400_CEILING
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m24ss.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 2400 ceiling config files"
install -resource Function -name "IRB" -descr "2400 ceiling"
config -filename  flp1:/irbcfg/m24ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24se.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_225_75
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m642275s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,25-75 Elmo"
install -resource Function -name "IRB" -descr "6400/2,25-75"
config -filename  flp1:/irbcfg/m642275s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642275i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642275e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_24_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m642412s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,4-120 Elmo"
install -resource Function -name "IRB" -descr "6400/2,4-120"
config -filename  flp1:/irbcfg/m642412s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642412i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642412e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_24_150
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m642415s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,4-150 Elmo"
install -resource Function -name "IRB" -descr "6400/2,4-150"
config -filename  flp1:/irbcfg/m642415s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642415i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642415e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_28_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m642812s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,8-120 Elmo"
install -resource Function -name "IRB" -descr "6400/2,8-120"
config -filename  flp1:/irbcfg/m642812s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642812i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642812e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_29_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m642912s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/S2,9-120 Elmo"
install -resource Function -name "IRB" -descr "6400/S2,9-120"
config -filename  flp1:/irbcfg/m642912s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642912i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642912e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_30_75
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/m643075s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/3,0-75 Elmo"
install -resource Function -name "IRB" -descr "6400/3,0-75"
config -filename  flp1:/irbcfg/m643075s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m643075i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m643075e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_24_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/s642412s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,4-120 Siemens"
install -resource Function -name "IRB" -descr "6400/2,4-120"
config -filename  flp1:/irbcfg/s642412s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642412i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642412e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_24_150
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/s642415s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,4-150 Siemens"
install -resource Function -name "IRB" -descr "6400/2,4-150"
config -filename  flp1:/irbcfg/s642415s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642415i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642415e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_28_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/s642812s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,8-120 Siemens"
install -resource Function -name "IRB" -descr "6400/2,8-120"
config -filename  flp1:/irbcfg/s642812s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642812i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642812e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_29_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/s642912s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/S2,9-120 Siemens"
install -resource Function -name "IRB" -descr "6400/S2,9-120"
config -filename  flp1:/irbcfg/s642912s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642912i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642912e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_30_75
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/s643075s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/3,0-75 Siemens"
install -resource Function -name "IRB" -descr "6400/3,0-75"
config -filename  flp1:/irbcfg/s643075s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s643075i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s643075e.cfg -domain MOC
goto -label NEXT_STEP
#IRBP6400_24_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/p642412s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,4-120 M96"
install -resource Function -name "IRB" -descr "6400/2,4-120"
config -filename  flp1:/irbcfg/p642412s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642412i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642412e.cfg -domain MOC
goto -label NEXT_STEP
#IRBP6400_28_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/p642812s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,8-120 M96"
install -resource Function -name "IRB" -descr "6400/2,8-120"
config -filename  flp1:/irbcfg/p642812s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642812i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642812e.cfg -domain MOC
goto -label NEXT_STEP
#IRBP6400_24_150
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/p642415s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB 6400/2,4-150 M96"
install -resource Function -name "IRB" -descr "6400/2,4-150"
config -filename  flp1:/irbcfg/p642415s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642415i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642415e.cfg -domain MOC
goto -label NEXT_STEP
#IRBPAL_120
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/mpal120s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB6400C/B-120 config files"
install -resource Function -name "IRB" -descr "6400C/B-120"
config -filename  flp1:/irbcfg/mpal120s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/mpal120i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/mpal120e.cfg -domain MOC
goto -label NEXT_STEP
#IRBPAL_150
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
fileexist -path flp1:/irbcfg/mpal150s.cfg -label LOAD_MOC
echo -text "Incorrect IRB disk!"
echo -text "Insert IRB disk(2) and press ok:"
query -text "                                  OK  " -var 10 -fk_text
#LOAD_MOC
echo -text "Installing IRB6400C/B-150 config files"
install -resource Function -name "IRB" -descr "6400C/B-150"
config -filename  flp1:/irbcfg/mpal150s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/mpal150i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/mpal150e.cfg -domain MOC
goto -label NEXT_STEP
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
