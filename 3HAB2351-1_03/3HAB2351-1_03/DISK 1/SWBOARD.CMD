################################################################################
#
# Note:
#       . used variables:
#
#             var 22 = is set here to report what kind of Board is to be used
#             var 23 = is set here to report what kind of Board is to be used
#
#
################################################################################

#############
# Beginning #
#############


################################
# Selection of SW Board type   #
################################
#sweio_cd.cfg needs to be copied to ram1sdisc even for standard,
#as option weldtimer uses it
copy -from flp1:sweio_cd.cfg -to ram1disk:sweio_cd.cfg
#TEST change back according to above
#copy -from sweio_cd.cfg -to ram1disk:sweio_cd.cfg

echo -text " "
echo -text "Standard SpotWare Board Configuration"
echo -text "is a Digital Board at Rack Position 1"
echo -text " "
echo -text "Is this ok?"
echo -text " "
query -text " Yes     No                              " -var 22 -fk_text
if -var 22 -value 10 -label STANDARD

#
# User Def
#


echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text "Select Board Type: "
echo -text "- Digital Board"
echo -text "- Combi Board"
echo -text " "
query -text "Digital Combi                               " -var 22 -fk_text

if -var 22 -value 10 -label DIGITAL
if -var 22 -value 20 -label COMBI

#DIGITAL
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text "Digital Board selected "
echo -text " "
query -text "Select Rack Position:" -var 22
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
if -var 22 -value 1 -label DIG1
if -var 22 -value 2 -label DIG2
if -var 22 -value 3 -label DIG3
if -var 22 -value 4 -label DIG4
if -var 22 -value 5 -label DIG5
if -var 22 -value 6 -label DIG6
#
#ERROR
echo -text " " 
echo -text "Rack Position doesn't exist "
echo -text "Rack Position 1 selected!!!!"
#
#DIG1
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16"
echo -text " "
echo -text "Digital Board Selected at pos. 1"
goto -label NEXT_STEP
#DIG2
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "d223 -Bus BAS -Address 0x2 -Digin 16 -Digout 16"
echo -text " "
echo -text "Digital Board Selected at pos. 2"
goto -label NEXT_STEP
#DIG3
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "d223 -Bus BAS -Address 0x3 -Digin 16 -Digout 16"
echo -text " "
echo -text "Digital Board Selected at pos. 3"
goto -label NEXT_STEP
#DIG4
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "d223 -Bus BAS -Address 0x4 -Digin 16 -Digout 16"
echo -text " "
echo -text "Digital Board Selected at pos. 4"
goto -label NEXT_STEP
#DIG5
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "d223 -Bus BAS -Address 0x5 -Digin 16 -Digout 16"
echo -text " "
echo -text "Digital Board Selected at pos. 5"
goto -label NEXT_STEP
#DIG6
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "d223 -Bus BAS -Address 0x6 -Digin 16 -Digout 16"
echo -text " "
echo -text "Digital Board Selected at pos. 6"
goto -label NEXT_STEP

#COMBI
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text "Combi Board Selected "
echo -text " "
query -text "Select Rack Position:" -var 22

echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
if -var 22 -value 1 -label COM1
if -var 22 -value 2 -label COM2
if -var 22 -value 3 -label COM3
if -var 22 -value 4 -label COM4
if -var 22 -value 5 -label COM5
if -var 22 -value 6 -label COM6
#ERROR
echo -text " " 
echo -text "Rack Position doesn't exist "
echo -text "Rack Position 1 selected!!!!"
#
#COM1
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "a315 -Bus BAS -Address 0x1 -Digin 16 -Digout 16 -Anout 2"
echo -text " "
echo -text "Combi Board Selected at pos. 1"
goto -label NEXT_STEP
#COM2
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "a315 -Bus BAS -Address 0x2 -Digin 16 -Digout 16 -Anout 2"
echo -text " "
echo -text "Combi Board Selected at pos. 2"
goto -label NEXT_STEP
#COM3
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "a315 -Bus BAS -Address 0x3 -Digin 16 -Digout 16 -Anout 2"
echo -text " "
echo -text "Combi Board Selected at pos. 3"
goto -label NEXT_STEP
#COM4
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "a315 -Bus BAS -Address 0x4 -Digin 16 -Digout 16 -Anout 2"
echo -text " "
echo -text "Combi Board Selected at pos. 4"
goto -label NEXT_STEP
#COM5
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "a315 -Bus BAS -Address 0x5 -Digin 16 -Digout 16 -Anout 2"
echo -text " "
echo -text "Combi Board Selected at pos. 5"
goto -label NEXT_STEP
#COM6
find_replace -path ram1disk:sweio_cd.cfg -find "d223 -Bus BAS -Address 0x1 -Digin 16 -Digout 16" -replace "a315 -Bus BAS -Address 0x6 -Digin 16 -Digout 16 -Anout 2"
echo -text " "
echo -text "Combi Board Selected at pos. 6"
goto -label NEXT_STEP



#NEXT_STEP
#TEST delete next row
#copy -from ram1disk:sweio_cd.cfg -to sweio_cd.tst

config -filename ram1disk:sweio_cd.cfg -domain EIO
# Cannot delete -path ram1disk:sweio_cd.cfg here, 
# as serial weld timer MIGHT be installed 
# delete -path ram1disk:sweio_cd.cfg  is done on weld timer disc IF installed  

goto -label END

#STANDARD 

echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text " "
echo -text "Digital Board is selected at pos 1"
config -filename flp1:sweio_cd.cfg -domain EIO
#TEST change according to above 
#config -filename sweio_cd.cfg -domain EIO

goto -label END

#######
# End #
#######

#
#END
