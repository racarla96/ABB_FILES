# Install.cmd script for the S4 system rel 2.1 /pe 960131
# Option config files
if -var 24 -value 10 -label END_LABEL
echo -text "Installing Advanced Functions"
config -filename  flp1:rladv.cfg -domain SYS -internal
# Logical cross connections included in this option
install -resource Function -name "LOCRS"
setvar -var 24 -value 10
#END_LABEL
# Install.cmd script for the fox system rel 2.0 /pe 950604
#
# Option config files
################################################################################
#
#  Install subject: gld (GlueWare)
#  $Revision: 1.2 $
#
# MODIFICATIONS
# $Log: install.cmd,v $
# Revision 1.2  1996/02/23  11:49:54  sigadmin
# Patch: akol2302H12M44S17 Solved SPR: Test status: NT Log: The installation of Advanced Functions changed.
#
:: Revision 1.3  1996/02/23  11:35:41  akol
:: Installing of Advanced functions deleted.
::
:: Revision 1.2  1996/01/22  12:25:40  akol
:: The system module gltext added.
::
:: Revision 1.1  1995/11/30  15:17:10  akol
:: Initial revision
::
#
#
################################################################################
# Install.cmd script for installation of the basic GlueWare add-on package.
#
# Use:
#      this file will be included by the root to the main installation script
#      with the specific 'include' command.
#
################################################################################
#
#############
# Beginning #
#############
#
echo -text " "
echo -text "Installing GlueWare..."
#
###################################################
# Base national Language independent files (text) #
###################################################
#
text -filename flp1:gldata.eng -package 0
#
#########################################################
# Rapid national Language dependent files (Rapid sys) #
#########################################################
#
copy -from flp1:gltext_s.$LANG -to ram1disk:gltext.sys
#
#######################################
# National Language Independent files #
#######################################
#
copy -from flp1:glbase_s.eng -to ram1disk:glbase.sys
copy -from flp1:gluser_s.eng -to ram1disk:gluser.sys
#
# Rapid : cfg (Rapid programming rules)
config -filename flp1:gldata.cfg -domain MMC -internal
#
# CAB   : cfg (definitions & configurations)
config -filename flp1:glsysrp.cfg -domain SYS
config -filename flp1:glsys.cfg -domain SYS -internal
#
# EIO   : cfg (definitions & configurations)
config -filename flp1:gleio.cfg -domain EIO
#
#END
echo -text " "
echo -text "GlueWare installation done."

