# Install.cmd script for the fox system rel 2.1 /pe 960115
#
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
text -filename flp1:txt$TXTDIR/prop.$LANG -package 0
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
text -filename flp1:txt$TXTDIR/cab.$LANG -package 0
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
