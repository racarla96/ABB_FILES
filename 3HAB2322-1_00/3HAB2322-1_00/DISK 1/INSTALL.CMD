###################################################
# install.cmd under the option multitask
#
# $Revision: 1.3 $
#
# DESCRIPTION:
#   Install.cmd script for Multitask
#
# MODIFICATIONS:
# $Log: install.cmd,v $
# Revision 1.3  1995/05/18  09:04:46  sigadmin
# Patch: sejo1805H09M36S56 Solved SPR: Test status: NT Log: Remove of multreal.cfg
#
# Revision 1.4  1995/05/18  07:26:35  sejo
# Remove of multreal.cfg
#
# Revision 1.3  1995/05/10  14:11:44  inre
# internal for mmc instances
#
# Revision 1.2  1995/05/08  12:38:05  inre
# add install MT
#
# Revision 1.1  1995/04/05  15:48:48  roladmin
# Initial revision\
# ^^^^^^^^^^^^ PROJECT COMMENTS BEGIN ^^^^^^^^^^^^^
#
# Revision 1.1  1995/04/05  15:15:46  roladmin
# Initial revision
#
# Revision 1.2  1995/03/31  13:42:47  sejo
# Add multreal.cfg and base_mt.sys
#
# Revision 1.1  1995/03/23  13:42:21  inre
# Initial revision
#
#

echo -text "Installing The Multitask option ..."
install -name MT -resource Function

config -filename  flp1:mult_mmc.cfg -domain MMC -internal

copy -from flp1:base_mt.sys -to ram1disk:base_mt.sys

#END_LABEL
