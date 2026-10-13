# Install.cmd script for the S4 system rel 2.1 /pe 960107
#

# Install questions
#    var 1  = irb type
#    var 2  = mounting type
#    var 3  = irb variant
#    var 10 = link type
echo -text ""
echo -text "IRB 1400 2400 3400 4400 S4 2.1"
echo -text ""
echo -text "Select IRB type to install :"
query -text  "1400     2400    3400    4400         " \
      -var 1 -fk_text

if -var 1 -value 10 -label TYPE_1400
if -var 1 -value 20 -label MOUNTING_LABEL
if -var 1 -value 30 -label TYPE_3400
if -var 1 -value 40 -label TYPE_4400
goto -label END_LABEL
#TYPE_1400
echo -text "Select IRB1400 model :"
query -text "  base   hanging                     " -var 3 -fk_text
if -var 3 -value 10 -label IRB_LABEL
if -var 3 -value 20 -label MOUNTING_LABEL
goto -label END_LABEL
#TYPE_3400
echo -text "Select IRB3400 model :"
query -text "  base foundry 2.5-10                " -var 3 -fk_text
if -var 3 -value 10 -label IRB_LABEL
if -var 3 -value 20 -label IRB_LABEL
if -var 3 -value 30 -label DCLINK_LABEL
goto -label END_LABEL
#DCLINK_LABEL
echo -text "Select DC Link type:"
query -text " Stand   LinkB                        " -var 10 -fk_text
if -var 10 -value 10 -label IRB_LABEL
if -var 10 -value 20 -label IRB_LABEL
goto -label END_LABEL
#TYPE_4400
echo -text "Select IRB4400 model :"
query -text "1.95-45 1.95-60                      " -var 3 -fk_text
if -var 3 -value 10 -label IRB_LABEL
if -var 3 -value 20 -label IRB_LABEL
goto -label END_LABEL
#MOUNTING_LABEL
echo -text "Select mounting of the IRB:"
query -text " Floor  Ceiling                       " -var 2 -fk_text
if -var 2 -value 10 -label IRB_LABEL
if -var 2 -value 20 -label IRB_LABEL
goto -label END_LABEL
# IRB config files
#IRB_LABEL
if -var 1 -value 10 -label IRB1400_BASE
if -var 1 -value 20 -label IRB2400_BASE
if -var 1 -value 30 -label IRB3400_BASE
if -var 1 -value 40 -label IRB4400_BASE
goto -label END_LABEL
#IRB1400_BASE
if -var 3 -value 10 -label IRB1400_FLOOR
if -var 2 -value 10 -label IRB1400_CEILING_FLOOR
if -var 2 -value 20 -label IRB1400_CEILING
goto -label END_LABEL
#IRB2400_BASE
if -var 2 -value 10 -label IRB2400_FLOOR
if -var 2 -value 20 -label IRB2400_CEILING
goto -label END_LABEL
#IRB3400_BASE
if -var 3 -value 10 -label IRB3400_FLOOR
if -var 3 -value 20 -label IRB3400_FOUNDRY
if -var 3 -value 30 -label IRB3400_2_5_TYPE
goto -label END_LABEL
#IRB3400_2_5_TYPE
if -var 10 -value 10 -label IRB3400_2_5
if -var 10 -value 20 -label IRB3400_2_5_HD
goto -label END_LABEL
#IRB4400_BASE
if -var 3 -value 10 -label IRB4400_45
if -var 3 -value 20 -label IRB4400_60
goto -label END_LABEL
#IRB1400_FLOOR
echo -text "Installing IRB 1400 config files"
install -resource Function -name "IRB" -descr "1400"
config -filename  flp1:/irbcfg/m14fs.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14fe.cfg -domain MOC
goto -label END_LABEL
#IRB2400_FLOOR
echo -text "Installing IRB 2400 config files"
install -resource Function -name "IRB" -descr "2400"
config -filename  flp1:/irbcfg/m24fs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m24fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24fe.cfg -domain MOC
goto -label END_LABEL
#IRB3400_FLOOR
echo -text "Installing IRB 3400/1.95-30 config files"
install -resource Function -name "IRB" -descr "3400/1.95-30"
config -filename  flp1:/irbcfg/m34fs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m34fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m34fe.cfg -domain MOC
goto -label END_LABEL
#IRB3400_FOUNDRY
echo -text "Installing IRB 3400F/1.95-30 config files"
install -resource Function -name "IRB" -descr "3400F/1.95-30"
config -filename  flp1:/irbcfg/m34fofs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m34fofi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m34fofe.cfg -domain MOC
goto -label END_LABEL
#IRB3400_2_5
echo -text "Installing IRB 3400/2.5-10 config files"
install -resource Function -name "IRB" -descr "3400/2.5-10"
config -filename  flp1:/irbcfg/m3425fs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m3425fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m3425fe.cfg -domain MOC
goto -label END_LABEL
#IRB3400_2_5_HD
echo -text "Installing IRB 3400/2.5-10 DCLinkB config files"
install -resource Function -name "IRB" -descr "3400/2.5-10 DCLinkB"
config -filename  flp1:/irbcfg/h3425fs.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/h3425fi.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/h3425fe.cfg -domain MOC
goto -label END_LABEL
#IRB4400_45
echo -text "Installing IRB 4400/1.95-45 config files"
install -resource Function -name "IRB" -descr "4400/1.95-45"
config -filename  flp1:/irbcfg/m441845s.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m441845i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m441845e.cfg -domain MOC
goto -label END_LABEL
#IRB4400_60
echo -text "Installing IRB 4400/1.95-60 config files"
install -resource Function -name "IRB" -descr "4400/1.95-60"
config -filename  flp1:/irbcfg/m441860s.cfg -domain MOC -internal 
config -filename  flp1:/irbcfg/m441860i.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m441860e.cfg -domain MOC
goto -label END_LABEL
#IRB1400_CEILING
echo -text "Installing IRB 1400H config files"
install -resource Function -name "IRB" -descr "1400H"
config -filename  flp1:/irbcfg/m14ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14se.cfg -domain MOC
goto -label END_LABEL
#IRB1400_CEILING_FLOOR
echo -text "Installing IRB 1400H floor config files"
install -resource Function -name "IRB" -descr "1400H floor"
config -filename  flp1:/irbcfg/m14sis.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14sii.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m14sie.cfg -domain MOC
goto -label END_LABEL
#IRB2400_CEILING
echo -text "Installing IRB 2400H config files"
install -resource Function -name "IRB" -descr "2400H"
config -filename  flp1:/irbcfg/m24ss.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24si.cfg -domain MOC -internal
config -filename  flp1:/irbcfg/m24se.cfg -domain MOC
#END_LABEL
