# Install.cmd script for the S4 system rel 2.1 /pe 960131
# Option config files
if -var 24 -value 10 -label END_LABEL
echo -text "Installing Advanced Functions"
config -filename  flp1:rladv.cfg -domain SYS -internal
# Logical cross connections included in this option
install -resource Function -name "LOCRS"
setvar -var 24 -value 10
#END_LABEL
