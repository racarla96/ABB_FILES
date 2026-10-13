# Install.cmd script for the s4 system rel 3.0 /JH 970815
#
#S4C_ONLY if -var 9 -value 50 -label USER_QUERY
#S4C_ONLY setvar -var 10 -value 0
#S4C_ONLY getkey -id "LangSelect" -var 10 -strvar $ANSWER -errlabel SELECT_ENG
#S4C_ONLY goto -strvar $ANSWER
#S4C_ONLY #SELECT_ENG
#S4C_ONLY goto -label ENGLISH
#S4C_ONLY #USER_QUERY
#S4C_ONLY echo -text "Teach Pendant Language"
#S4C_ONLY echo -text "0 - English"
#S4C_ONLY echo -text "1 - Swedish"
#S4C_ONLY echo -text "2 - German"
#S4C_ONLY echo -text "3 - Francais"
#S4C_ONLY echo -text "4 - Spanish"
#S4C_ONLY echo -text "5 - Portuguese"
#S4C_ONLY echo -text "6 - Danish"
#S4C_ONLY echo -text "7 - Italian"
#S4C_ONLY echo -text "8 - Dutch"
#S4C_ONLY echo -text "9 - Japanese (Katakana)"
#S4C_ONLY query -text "Select Teach Pendant Language:" -var 5 
#S4C_ONLY echo -text " "
#S4C_ONLY if -var 5 -value 0 -label ENGLISH
#S4C_ONLY if -var 5 -value 1 -label SWEDISH
#S4C_ONLY if -var 5 -value 2 -label GERMAN
#S4C_ONLY if -var 5 -value 3 -label FRENCH
#S4C_ONLY if -var 5 -value 4 -label SPANISH
#S4C_ONLY if -var 5 -value 5 -label PORTUGUESE
#S4C_ONLY if -var 5 -value 6 -label DANISH
#S4C_ONLY if -var 5 -value 7 -label ITALIAN
#S4C_ONLY if -var 5 -value 8 -label DUTCH
#S4C_ONLY if -var 5 -value 9 -label JAPANESE
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #ENGLISH
#S4C_ONLY echo -text "Installing English text files"
#S4C_ONLY setstr -strvar $LANG -value "eng"
#S4C_ONLY setstr -strvar $TXTDIR -value "eng"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #SWEDISH
#S4C_ONLY echo -text "Installing Swedish text files"
#S4C_ONLY setstr -strvar $LANG -value "swe"
#S4C_ONLY setstr -strvar $TXTDIR -value "swe"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #GERMAN
#S4C_ONLY echo -text "Installing German text files"
#S4C_ONLY setstr -strvar $LANG -value "ger"
#S4C_ONLY setstr -strvar $TXTDIR -value "ger"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #FRENCH
#S4C_ONLY echo -text "Installing French text files"
#S4C_ONLY setstr -strvar $LANG -value "fra"
#S4C_ONLY setstr -strvar $TXTDIR -value "fra"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #SPANISH
#S4C_ONLY echo -text "Installing Spanish text files"
#S4C_ONLY setstr -strvar $LANG -value "spa"
#S4C_ONLY setstr -strvar $TXTDIR -value "spa"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #PORTUGUESE
#S4C_ONLY echo -text "Installing Portuguese text files"
#S4C_ONLY setstr -strvar $LANG -value "por"
#S4C_ONLY setstr -strvar $TXTDIR -value "por"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #DANISH
#S4C_ONLY echo -text "Installing Danish text files"
#S4C_ONLY setstr -strvar $LANG -value "dan"
#S4C_ONLY setstr -strvar $TXTDIR -value "dan"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #ITALIAN
#S4C_ONLY echo -text "Installing Italian text files"
#S4C_ONLY setstr -strvar $LANG -value "ita"
#S4C_ONLY setstr -strvar $TXTDIR -value "ita"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #DUTCH
#S4C_ONLY echo -text "Installing Dutch text files"
#S4C_ONLY setstr -strvar $LANG -value "dut"
#S4C_ONLY setstr -strvar $TXTDIR -value "dut"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #FINNISH
#S4C_ONLY echo -text "Installing Finnish text files"
#S4C_ONLY setstr -strvar $LANG -value "fin"
#S4C_ONLY setstr -strvar $TXTDIR -value "fin"
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #JAPANESE
#S4C_ONLY echo -text "Installing Japanese text files"
#S4C_ONLY setstr -strvar $LANG -value "jap"
#S4C_ONLY setstr -strvar $TXTDIR -value "jap"
#S4C_ONLY #load Katakana fonts
#S4C_ONLY setvar -var 7 -value 1
#S4C_ONLY goto -label INST_LANG
#S4C_ONLY #INST_LANG
fileexist -path $BOOTPATH/txt$TXTDIR/hi.$LANG -label LOAD_TEXT
echo -text "Language not available!"
echo -text "Installing English text files"
setstr -strvar $LANG -value "eng"
setstr -strvar $TXTDIR -value "eng"
#LOAD_TEXT
text -filename $BOOTPATH/txt$TXTDIR/fox.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hi.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/him.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hix.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hif.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hio.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hic.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hij.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/his.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hia.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hiaerr.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/prop.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hiasea.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hip.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hiref.$LANG -package 0
#
# RAPID error texts
#
text -filename  $BOOTPATH/txt$TXTDIR/rlmseter.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlmoveer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlmsyser.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlexeer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlcomer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlioer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rltraper.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlmmecer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlsyser.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlloader.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlcureer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlmsrcer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rltriger.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlrapser.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlmather.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlsseter.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlstrer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlwzer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rltooler.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlsymer.$LANG -package 0
text -filename  $BOOTPATH/txt$TXTDIR/rlbiter.$LANG -package 0
#
#Configuration edit texts
#
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/eiommcnx.$LANG -package 0
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/eio_rio.$LANG -package 0
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/eio_351.$LANG -package 0
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/eio_352.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/eiommcs4.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/mmc_cfg.$LANG -package 0
# using moccfgnx.eng for S4C-systems and moccfgs4.eng for S4-systems
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/moccfgnx.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/moccfgs4.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/com_mmc.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/sys_mmc.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/cab.$LANG -package 0
#
#elog texts
#
text -filename $BOOTPATH/txt$TXTDIR/usr_elog.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/mmc_elog.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/sys_elog.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/opr_elog.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/arl_elog.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/io_elog.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hw_elog.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/moc_elog.$LANG -package 0
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/io_s4c.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/io_s4.$LANG -package 0
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/hw_s4c.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/hw_s4.$LANG -package 0
#S4C_ONLY text -filename $BOOTPATH/txt$TXTDIR/sys_s4c.$LANG -package 0
text -filename $BOOTPATH/txt$TXTDIR/sys_s4.$LANG -package 0
