# Install.cmd script for the S4 system rel 2.1 /pe 960216
#

# Install questions
#    var 1  = irb type
#    var 3  = irb variant
#    var 10 = temp use. type (HD/Base)
echo -text ""
echo -text "IRB 2400 M96, 540 S4 2.1"
echo -text ""
echo -text "Select IRB type to install :"
query -text  " 2400    540                          " \
      -var 1 -fk_text

if -var 1 -value 10 -label TYPE_2400
if -var 1 -value 20 -label IRB540
goto -label END_LABEL
#TYPE_2400
echo -text "Select IRB2400 model :"
query -text  "1,5-10  1,5-16  1,8-5                 " \
      -var 3 -fk_text
if -var 3 -value 10 -label MOUNTING_LABLE
if -var 3 -value 20 -label MOUNTING_LABLE
if -var 3 -value 30 -label MOUNTING_LABLE
#MOUNTING_LABLE
echo -text "Select mounting of the IRB:"
query -text " Floor  Ceiling                       " -var 2 -fk_text
if -var 2 -value 10 -label DCLINK_LABLE
if -var 2 -value 20 -label DCLINK_LABLE
goto -label END_LABEL
#DCLINK_LABLE
echo -text "Select DC Link type:"
query -text " Stand   LinkB                        " -var 10 -fk_text
if -var 10 -value 10 -label IRB2400_BASE
if -var 10 -value 20 -label IRB2400_HD
goto -label END_LABEL
#IRB2400_BASE
if -var 2 -value 10 -label IRB2400_F_B
if -var 2 -value 20 -label IRB2400_H_B
goto -label END_LABEL
#IRB2400_HD
if -var 2 -value 10 -label IRB2400_F_HD
if -var 2 -value 20 -label IRB2400_H_HD
goto -label END_LABEL
#IRB2400_F_B
if -var 3 -value 10 -label IRB2400_1_5_10
if -var 3 -value 20 -label IRB2400_1_5_16
if -var 3 -value 30 -label IRB2400L_1_8_5
goto -label END_LABEL
#IRB2400_H_B
if -var 3 -value 10 -label IRB2400H_1_5_10
if -var 3 -value 20 -label IRB2400H_1_5_16
if -var 3 -value 30 -label IRB2400LH_1_8_5
goto -label END_LABEL
#IRB2400_F_HD
if -var 3 -value 10 -label IRB2400_1_5_10_HD
if -var 3 -value 20 -label IRB2400_1_5_16_HD
if -var 3 -value 30 -label IRB2400L_1_8_5_HD
goto -label END_LABEL
#IRB2400_H_HD
if -var 3 -value 10 -label IRB2400H_1_5_10_HD
if -var 3 -value 20 -label IRB2400H_1_5_16_HD
if -var 3 -value 30 -label IRB2400LH_1_8_5_HD
goto -label END_LABEL
#IRB2400_1_5_10
echo -text "Installing IRB 2400/1.5-10"
install -resource Function -name "IRB" -descr "2400/1.5-10"
config -filename  flp1:/irbcfg/m24510fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24510fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24510fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400_1_5_16
echo -text "Installing IRB 2400/1.5-16"
install -resource Function -name "IRB" -descr "2400/1.5-16"
config -filename  flp1:/irbcfg/m24516fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24516fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24516fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400L_1_8_5
echo -text "Installing IRB 2400L/1.8-5"
install -resource Function -name "IRB" -descr "2400L/1.8-5"
config -filename  flp1:/irbcfg/m248fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m248fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m248fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400H_1_5_10
echo -text "Installing IRB 2400H/1.5-10"
install -resource Function -name "IRB" -descr "2400H/1.5-10"
config -filename  flp1:/irbcfg/m24510ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24510si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24510se.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400H_1_5_16
echo -text "Installing IRB 2400H/1.5-16"
install -resource Function -name "IRB" -descr "2400H/1.5-16"
config -filename  flp1:/irbcfg/m24516ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24516si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24516se.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400LH_1_8_5
echo -text "Installing IRB 2400LH/1.8-5"
install -resource Function -name "IRB" -descr "2400LH/1.8-5"
config -filename  flp1:/irbcfg/m248ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m248si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m248se.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400_1_5_10_HD
echo -text "Installing IRB 2400/1.5-10 DCLinkB"
install -resource Function -name "IRB" -descr "2400/1.5-10 DCLinkB"
config -filename  flp1:/irbcfg/h24510fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24510fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24510fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400_1_5_16_HD
echo -text "Installing IRB 2400/1.5-16 DCLinkB"
install -resource Function -name "IRB" -descr "2400/1.5-16 DCLinkB"
config -filename  flp1:/irbcfg/h24516fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24516fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24516fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400L_1_8_5_HD
echo -text "Installing IRB 2400L/1.8-5 DCLinkB"
install -resource Function -name "IRB" -descr "2400L/1.8-5 DCLinkB"
config -filename  flp1:/irbcfg/h248fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h248fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h248fe.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400H_1_5_10_HD
echo -text "Installing IRB 2400H/1.5-10 DCLinkB"
install -resource Function -name "IRB" -descr "2400H/1.5-10 DCLinkB"
config -filename  flp1:/irbcfg/h24510ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24510si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24510se.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400H_1_5_16_HD
echo -text "Installing IRB 2400H/1.5-16 DCLinkB"
install -resource Function -name "IRB" -descr "2400H/1.5-16 DCLinkB"
config -filename  flp1:/irbcfg/h24516ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24516si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h24516se.cfg -domain MOC
goto -label NEXT_STEP
#IRB2400LH_1_8_5_HD
echo -text "Installing IRB 2400LH/1.8-5 DCLinkB"
install -resource Function -name "IRB" -descr "2400LH/1.8-5 DCLinkB"
config -filename  flp1:/irbcfg/h248ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h248si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h248se.cfg -domain MOC
goto -label NEXT_STEP
#IRB540
echo -text "Installing IRB 540"
install -resource Function -name "IRB" -descr "540"
config -filename  flp1:/irbcfg/m540fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m540fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m540fe.cfg -domain MOC
goto -label NEXT_STEP
#NEXT_STEP
echo -text " "
