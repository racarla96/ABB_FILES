ABB Robotics Products AB S4 Program Update May 14 1995

This PC Tool is used to update S4 programs to a higher revision number by 
authorizing generic revision boot disks,which are disks with empty serial
number.These disks therefore cannot be booted into the S4 controller.
Each robot system is to have a unique set of boot disks with its system
serial number,e.g. IRB6400-0187,on them.To the system there belongs a number 
of different programs that each is specified by a program number e.g. 
3HAB2312-1/02 .A program includes one or more boot disks numbered 1,2,3..
Main number is 3HAB2312 and sub number is -1 and revision number is /02.

To update a system all used programs must be updated.For each program one
original boot disk must be first inserted to get the original serial number 
from it and then the generic revision boot disk(s) have to be inserted in 
sequence and become authorized by transfering the serial number to them.
For each ready disk a status line is displayed.The authorized revision 
disk(s) become new original ones.
The serial number must also be written by hand on each new disk label.
The revision boot disks must have write protect off when authorizing.

It is only possible to update to programs with the same main program number 
as the original one that is 3HAB2312 in the example above.

If any failure occurs it is possible to select a single disk to authorize.
DOS error message is read out if the disk is not inserted or if the revision
disk is write protected.To continue remedy the fault and press the first
letter in the new attempt command.
