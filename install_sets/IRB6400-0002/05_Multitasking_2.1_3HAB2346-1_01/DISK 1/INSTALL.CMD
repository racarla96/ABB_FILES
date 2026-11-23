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
# Revision 1.3  1996/03/08  13:25:59  sigadmin
# Patch: sejo0803H14M14S56 Solved SPR: S960391 Test status: NT Log: No install if already installed
#
# Revision 1.4  1996/03/08  13:03:44  sejo
# Remove of ::
#
# Revision 1.3  1996/03/08  12:52:55  sejo
# Not installed if already installed
#
# Revision 1.2  1996/02/08  14:58:00  inre
# Add a init function for multitask, it will remove old definition of MMC desc. for CAB_TASKS
#
# Revision 1.1  1995/12/15  14:14:38  roladmin
# Initial revision\
# ^^^^^^^^^^^^ PROJECT COMMENTS BEGIN ^^^^^^^^^^^^^
#
# Revision 1.2  1995/12/15  14:13:54  roladmin
# vvvvvvvvvvvv PROJECT COMMENTS END vvvvvvvvvvvv\
# Moved back to subject from/projects/foxfun/rol/classlib/mlttsk
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

if -var 25 -value 10 -label END_LABEL

echo -text "Installing The Multitask option ..."
install -name MT -resource Function

init -entry mlttsk_init

config -filename  flp1:mult_mmc.cfg -domain MMC -internal

copy -from flp1:base_mt.sys -to ram1disk:base_mt.sys

setvar -var 25 -value 10

#END_LABEL
