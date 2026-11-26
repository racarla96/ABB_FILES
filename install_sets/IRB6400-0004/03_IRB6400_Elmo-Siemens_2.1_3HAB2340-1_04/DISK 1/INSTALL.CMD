# Install.cmd script for the S4 system rel 2.1 /pe 960216
#

# Install questions
#    var 3  = irb variant
#    var 10 = temp use. motor type (E/S)
echo -text ""
echo -text "IRB 6400 Elmo/Siemens S4 2.1"
echo -text ""
#TYPE_6400
echo -text "Select IRB6400 model :"
query -text  "2.25-75 2.4-120 2.4-150 2.8-120   SCAN" \
      -text2 "S2.9-120 3.0-75 2.4-balB          SCAN" -var 3 -fk_text
if -var 3 -value 10 -label M94A_MOTOR_6400
if -var 3 -value 20 -label M94A_MOTOR_6400
if -var 3 -value 30 -label M94A_MOTOR_6400
if -var 3 -value 40 -label M94A_MOTOR_6400
if -var 3 -value 110 -label M94A_MOTOR_6400
if -var 3 -value 120 -label M94A_MOTOR_6400
if -var 3 -value 130 -label M94A_MOTOR_6400
goto -label END_LABEL
#M94A_MOTOR_6400
echo -text "Select IRB6400 motor type alternative :"
echo -text "Check the label of motor at axis 4"
echo -text "if you are not sure what to select"
echo -text " "
query -text " Elmo  Siemens                     " -var 10 -fk_text
if -var 10 -value 10 -label IRB6400_E_M94A
if -var 10 -value 20 -label IRB6400_ES_M94A
goto -label END_LABEL
#IRB6400_E_M94A
if -var 3 -value 10 -label IRB6400PE_225_75
if -var 3 -value 20 -label IRB6400_24_120
if -var 3 -value 30 -label IRB6400_24_150
if -var 3 -value 40 -label IRB6400_28_120
if -var 3 -value 110 -label IRB6400S_29_120
if -var 3 -value 120 -label IRB6400_30_75
if -var 3 -value 130 -label IRB6400_24_BALB
goto -label END_LABEL
#IRB6400_ES_M94A
if -var 3 -value 10 -label IRBS6400PE_225_75
if -var 3 -value 20 -label IRBS6400_24_120
if -var 3 -value 30 -label IRBS6400_24_150
if -var 3 -value 40 -label IRBS6400_28_120
if -var 3 -value 110 -label IRBS6400S_29_120
if -var 3 -value 120 -label IRBS6400_30_75
if -var 3 -value 130 -label IRBS6400_24_BALB
goto -label END_LABEL
#IRB6400PE_225_75
echo -text "Installing IRB 6400PE/2.25-75 Elmo"
install -resource Function -name "IRB" -descr "6400PE/2.25-75 Elmo"
config -filename  flp1:/irbcfg/m642275s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642275i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642275e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_24_120
echo -text "Installing IRB 6400/2.4-120 Elmo"
install -resource Function -name "IRB" -descr "6400/2.4-120 Elmo"
config -filename  flp1:/irbcfg/m642412s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642412i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642412e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_24_150
echo -text "Installing IRB 6400/2.4-150 Elmo"
install -resource Function -name "IRB" -descr "6400/2.4-150 Elmo"
config -filename  flp1:/irbcfg/m642415s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642415i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642415e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_28_120
echo -text "Installing IRB 6400/2.8-120 Elmo"
install -resource Function -name "IRB" -descr "6400/2.8-120 Elmo"
config -filename  flp1:/irbcfg/m642812s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642812i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642812e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400S_29_120
echo -text "Installing IRB 6400S/2.9-120 Elmo"
install -resource Function -name "IRB" -descr "6400S/2.9-120 Elmo"
config -filename  flp1:/irbcfg/m642912s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642912i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m642912e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_30_75
echo -text "Installing IRB 6400/3.0-75 Elmo"
install -resource Function -name "IRB" -descr "6400/3.0-75 Elmo"
config -filename  flp1:/irbcfg/m643075s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m643075i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m643075e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_24_BALB
echo -text "Installing IRB 6400/2.4-120 balB Elmo"
install -resource Function -name "IRB" -descr "6400/2.4-120 balB Elmo"
config -filename  flp1:/irbcfg/m6424bbs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m6424bbi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m6424bbe.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_24_120
echo -text "Installing IRB 6400/2.4-120 Siemens"
install -resource Function -name "IRB" -descr "6400/2.4-120 Siemens"
config -filename  flp1:/irbcfg/s642412s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642412i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642412e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_24_150
echo -text "Installing IRB 6400/2.4-150 Siemens"
install -resource Function -name "IRB" -descr "6400/2.4-150 Siemens"
config -filename  flp1:/irbcfg/s642415s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642415i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642415e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_28_120
echo -text "Installing IRB 6400/2.8-120 Siemens"
install -resource Function -name "IRB" -descr "6400/2.8-120 Siemens"
config -filename  flp1:/irbcfg/s642812s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642812i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642812e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400S_29_120
echo -text "Installing IRB 6400S/2.9-120 Siemens"
install -resource Function -name "IRB" -descr "6400S/2.9-120 Siemens"
config -filename  flp1:/irbcfg/s642912s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642912i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642912e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_30_75
echo -text "Installing IRB 6400/3.0-75 Siemens"
install -resource Function -name "IRB" -descr "6400/3.0-75 Siemens"
config -filename  flp1:/irbcfg/s643075s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s643075i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s643075e.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400_24_BALB
echo -text "Installing IRB 6400/2.4-120 balB Siemens"
install -resource Function -name "IRB" -descr "6400/2.4-120 balB Siemens"
config -filename  flp1:/irbcfg/s6424bbs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s6424bbi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s6424bbe.cfg -domain MOC
goto -label NEXT_STEP
#IRBS6400PE_225_75
echo -text "Installing IRB 6400PE/2.25-75 Siemens"
install -resource Function -name "IRB" -descr "6400PE/2.25-75 Siemens"
config -filename  flp1:/irbcfg/s642275s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642275i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/s642275e.cfg -domain MOC
goto -label NEXT_STEP
#NEXT_STEP
echo -text " "
