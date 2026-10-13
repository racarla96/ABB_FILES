# Install.cmd script for the S4 system 
# Option config files
if -var 24 -value 10 -label END_LABEL
echo -text "Installing Advanced Functions"
config -filename  $BOOTPATH/advfun.cfg -domain SYS -internal
copy -from $BOOTPATH/advfun.sys -to ram1disk:advfun.sys
install -resource Function -name "LOCRS"
setvar -var 24 -value 10
#END_LABEL
