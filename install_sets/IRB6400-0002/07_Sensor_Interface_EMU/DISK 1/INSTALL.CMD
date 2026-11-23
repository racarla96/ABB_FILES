# Sensor Interface: replica para el EMULADOR (no es un disco de ABB)
if -var 26 -value 10 -label END_LABEL
echo -text "Installing Sensor Interface (EMU)"
text -filename flp1:rlsens.eng -package 0
config -filename flp1:rlsens.cfg -domain SYS -internal
config -filename flp1:com_sens.cfg -domain SIO
append -from flp1:startup.sen -to ram1disk:option.cmd
setvar -var 26 -value 10
#END_LABEL
