# Install set IRB6400-0001 (S4, BaseWare/RobotWare 2.1)

All `disc.id` files carry serial `IRB6400-0001` (header + hidden tail, made with `tools/discid.py retarget`). Not tested on a real controller.

| Folder | Program | Disks |
|---|---|---|
| 01_BaseWare_OS_2.1 | 3HAB2333-1/08 (no RAP) | 2 |
| 02_System_Parameters_2.1 | 3HAB2337-1/04 (factory, empty SYSPAR) | 1 |
| 03_IRB6400_Elmo-Siemens_2.1 | 3HAB2340-1/04 (M94A: asks Elmo/Siemens + model) | 1 |
| 04_Advanced_Functions_2.1 | 3HAB2344-1/00 | 1 |
| 05_Multitasking_2.1 | 3HAB2346-1/01 | 1 |
| 06_Teach_Pendant_Text_2.1 | 3HAB2356-1/03 | 2 |

Each `DISK n` folder is one 1.44 MB floppy (largest: 1.41 MB). Write them in the order above.
