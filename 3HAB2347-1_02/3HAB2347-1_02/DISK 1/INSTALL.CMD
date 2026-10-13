echo -text "Installing ArcWare ..."

init -entry awinst_init

text -filename flp1:awinst.$LANG -package 0
text -filename flp1:aw_elog.$LANG -package 0
text -filename flp1:awdata.eng -package 0
text -filename flp1:rlaw.eng -package 0
text -filename flp1:awmmc.$LANG -package 0

config -filename flp1:aw_sys.cfg -domain SYS  -internal
config -filename flp1:aw.cfg -domain PROC
config -filename flp1:awinst.cfg -domain MMC -internal
config -filename flp1:rlaw.cfg -domain MMC -internal
config -filename flp1:awmmc.cfg -domain MMC

append -from flp1:startup.aw -to ram1disk:option.cmd

new -entry awinst_new
