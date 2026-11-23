# Install set IRB6400-0002 (S4, BaseWare/RobotWare 2.1) = IRB6400-0001 + Sensor Interface (EMU replica)

Same disks as `../IRB6400-0001`, plus `07_Sensor_Interface_EMU`. All `disc.id` files carry serial `IRB6400-0001` (header + hidden tail, made with `tools/discid.py retarget`). Not tested on a real controller.

| Folder | Program | Disks |
|---|---|---|
| 01_BaseWare_OS_2.1 | 3HAB2333-1/**07** (03/1998) | **3** |
| 02_System_Parameters_2.1 | 3HAB2337-1/04 (factory, empty SYSPAR) | 1 |
| 03_IRB6400_Elmo-Siemens_2.1 | 3HAB2340-1/04 (M94A: asks Elmo/Siemens + model) | 1 |
| 04_Advanced_Functions_2.1 | 3HAB2344-1/00 | 1 |
| 05_Multitasking_2.1 | 3HAB2346-1/01 | 1 |
| 06_Teach_Pendant_Text_2.1 | 3HAB2356-1/03 | 2 |
| 07_Sensor_Interface_EMU | **not an ABB disk**: replica option disk (`EMU-SENS/01`) | 1 |

Each `DISK n` folder is one 1.44 MB floppy (2HD, IBM MFM, FAT12; largest: 1.41 MB). Write them in the order above: `01_` DISK 1, 2, 3, then `02_` … `06_`. `07_` is an option disk: insert it at an "Insert Option boot disk" prompt, after AF and MT.

## Why BaseWare OS rev. 07 and not rev. 08

This set originally had `3HAB2333-1/08` (no RAP) and `3HAB2334-1/08` (with RAP). Both were **removed** because they are not compatible with the IOC firmware and the EPROMs installed in this controller.

- The controller's robot computer board holds the boot EPROMs **D62 (-RRY)** and **D63 (-RRZ)**, firmware `BOOT-4911914-RRZ-360909-1.36`. That firmware is compatible with BaseWare 2.0, 2.1 and S4 3.0, but it is the *old* PROM generation.
- BaseWare OS 2.1 **rev. 08** expects the newer PROMs **3HAC 6382-1 (D62) / 3HAC 6383-1 (D63)**. They add *Quick Restart* on cold boot (a boot-safe area for the calibration offset `<cal_offset>` and the flag `<valid_cal_offset>`). With them the controller does not always run the full startup diagnostics or clear the whole memory, and rev. 08 was adapted to that. With old PROMs, rev. 08 can fail to install.
- ABB's own advice: try rev. 08, and if it does not work **revert to rev. 07**. That is what this set does.
- `3HAB2334-1/08` (RAP) is rev. 08 as well, so the same applies.

Sources: ABB notes on the PROM change (rev. 08 vs old PROMs) and a forum thread on RW 2.1 for an IRB1400 M94A S4 (`SYSTEM TPU-4911914-RDG-340614-0.01` on the TPU1 pendant, `BOOT-4911914-RRZ-360909-1.36` on the D62/D63 EPROMs).

## What is different in rev. 07

- **3 disks** instead of 2 (`abb_mc.000/.001/.002`). DISK 1 has boot + IOC + the first part of `abb_mc`; DISK 2 the second part; DISK 3 the last part and the configuration files (`install.cmd`, `*.cfg`, `*.eng`, `startup.cmd`, …). The `disc.id` of each says `Boot disk n (3)`.
- Dated 02/03/1998, original ABB build. File names are kept as they were in the source set (upper case).
- DISK 1 loads the IOC with `abb_ioc.000 -c_hi 0x3ba6 -c_lo 0xbb14` and sets the MemMC pools (`-mt 6 -rd 500 -pool 2060`, `-mt 14 … 4060`, `-mt 17 … 6500`). No RAP layer: serial port `sio1:` works as usual.
- Everything except `disc.id` is byte-identical to `3HAB2333-1_07/3HAB2333-1_07/DISK n`.

## How it was made

```bash
cp -r 3HAB2333-1_07/3HAB2333-1_07/DISK* install_sets/IRB6400-0001/01_BaseWare_OS_2.1_3HAB2333-1_07/
python3 tools/discid.py retarget --serial IRB6400-0001 install_sets/IRB6400-0001/01_*/DISK*/disc.id
python3 tools/discid.py check install_sets/IRB6400-0001/01_*/DISK*/disc.id
```

The source serial was `IRB6400-5424`; `retarget` keeps the header and writes the new serial in the header and in the hidden tail (see the `disc.id` section of the main README).

## Writing the disks (HxC USB)

`Floppy_Emulator_USB_HxC2001/abb_disk.py send "<folder>/DISK n"` builds a 1.44 MB FAT12 image and loads it in the HxC. Keep the terminal open while the robot reads the disk (`q` + Enter to release it). Do the three disks of `01_` in order, one at a time.

## Open points

- Not tested on a real controller (neither the serial change nor rev. 07 on these PROMs).
- If rev. 07 fails to boot or install, check the PROM revisions (D62/D63) and the IOC; the `-c_hi/-c_lo` values in `abb_load.cmd` are the IOC checksum.
- The RAP variant (`3HAB2334-1/08`) is gone from this set; it is still in the repo root if you ever swap the PROMs for 3HAC 6382-1 / 6383-1.

## 07_Sensor_Interface_EMU (replica, emulator only so far)

**Not an ABB disk and not tested on a robot.** Made by `emu/mk_sens_emu.py` of the repo `Proyecto-Futuro/abb-s4-baseware-lab`; analysis in `docs/rlsens-activacion.md` (same repo). It contains no code. It only enables things already compiled into `ABB_MC` 2.1/07 but not enabled by any configuration in this repo:

| File | What it does |
|---|---|
| `INSTALL.CMD` | `text` + `config` of the files below, `append` of `STARTUP.SEN` to `ram1disk:option.cmd` (like ArcWare); guard variable 26 (AF uses 24, MT 25) |
| `RLSENS.CFG` | `-Packet rlsens_syminsdef -Text 99 -Task 0`: RAPID `ReadVar`, `WriteVar`, `ReadBlock`, `WriteBlock`, `SEN_*` |
| `RLSENS.ENG` | text table 99 with those names (indices taken from the package definitions) |
| `COM_SENS.CFG` | SIO: transport type `RTP1` and `COM_TRP -Name laser1: -Type RTP1 -PhyChannel sio1:` |
| `STARTUP.SEN` | task `ltdists` (`ltdists_main`, IPC slot 35), which opens `laser1:` |
| `disc.id` | serial `IRB6400-0001`, program `EMU-SENS/01` (made with `tools/discid.py generate`) |

Status in the co-simulation (`emu/cosim.py` in that repo, full install with all 7 option/base disks): the disk is accepted by `registrate`, `Installing Sensor Interface (EMU)` runs with no error, and the warm start reaches `Startup ready` with no `Can't install rtp1 driver`. Whether `ltdists` opens `laser1:` and what the RTP1 protocol looks like on the wire is still being checked.

**Before using it on the robot:**
- `laser1:` takes `sio1:`. While it is configured, `Open "sio1:"` from RAPID (the streaming program) will not get the port. Change `-PhyChannel` in `COM_SENS.CFG` (and rebuild with `mk_sens_emu.py --phy`) if another channel is available.
- Full backup of the controller first, and a way back to the `IRB6400-0001` set.
- Assumptions not verified: text table 99 free, the `scaldata` field names, `COM_TRP_TYPE` accepting `RTP1` with no extra fields, priority/stack of `ltdists`.
