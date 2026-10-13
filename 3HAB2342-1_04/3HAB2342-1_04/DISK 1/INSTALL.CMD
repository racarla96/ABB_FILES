# Install.cmd script for the S4 system rel 2.1 /pe 960216
#

# Install questions
#    var 3  = irb variant
echo -text ""
echo -text "IRB 6400 M96 S4 2.1"
echo -text ""
#TYPE_6400
echo -text "Select IRB6400 M96 model :"
query -text  "2.4-120 2.4-150 2.8-120 S2.9-120  SCAN" \
      -text2 "3.0-75 2.4-balB                   SCAN" -var 3 -fk_text
if -var 3 -value 10 -label IRB6400_24_120
if -var 3 -value 20 -label IRB6400_24_150
if -var 3 -value 30 -label IRB6400_28_120
if -var 3 -value 40 -label IRB6400S_29_120
if -var 3 -value 110 -label IRB6400_30_75
if -var 3 -value 120 -label IRB6400_24_BALB
goto -label END_LABEL
#IRB6400_24_120
echo -text "Installing IRB 6400/2.4-120 M96"
install -resource Function -name "IRB" -descr "6400/2.4-120 M96"
config -filename  flp1:/irbcfg/p642412s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642412i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642412e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_24_150
echo -text "Installing IRB 6400/2.4-150 M96"
install -resource Function -name "IRB" -descr "6400/2.4-150 M96"
config -filename  flp1:/irbcfg/p642415s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642415i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642415e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_28_120
echo -text "Installing IRB 6400/2.8-120 M96"
install -resource Function -name "IRB" -descr "6400/2.8-120 M96"
config -filename  flp1:/irbcfg/p642812s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642812i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642812e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400S_29_120
echo -text "Installing IRB 6400S/2.9-120 M96"
install -resource Function -name "IRB" -descr "6400S/2.9-120 M96"
config -filename  flp1:/irbcfg/p642912s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642912i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p642912e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_30_75
echo -text "Installing IRB 6400/3.0-75 M96"
install -resource Function -name "IRB" -descr "6400/3.0-75 M96"
config -filename  flp1:/irbcfg/p643075s.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p643075i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p643075e.cfg -domain MOC
goto -label NEXT_STEP
#IRB6400_24_BALB
echo -text "Installing IRB 6400/2.4-120 balB M96"
install -resource Function -name "IRB" -descr "6400/2.4-120 balB M96"
config -filename  flp1:/irbcfg/p6424bbs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p6424bbi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/p6424bbe.cfg -domain MOC
goto -label NEXT_STEP
#NEXT_STEP
echo -text " "
