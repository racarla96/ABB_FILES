<!-- generado por mk_install_set_readtraj.py -->
# Install set IRB6400-0004 (S4, BaseWare 2.1/07) = IRB6400-0001 + `ReadTraj`, addition (new instruction, WriteBin kept) — EMU

**Modified ABB_MC. Not tested on a real controller.** Made by `emu/mk_install_set_readtraj.py` of the repo `Proyecto-Futuro/abb-s4-baseware-lab` (analysis: `docs/readtraj-implementacion.md`). It works in that repo's emulator (full install, `ReadTraj` called from a RAPID program, points received byte-exact). Built at Rafa's request to test installing it on the robot.

**Before installing:** full backup of the controller (programs, system parameters, `BACKUP` from the pendant) and the `IRB6400-0001` set at hand to go back.

## What changes against IRB6400-0001

Only the files below, in `01_BaseWare_OS_2.1_3HAB2333-1_07_ReadTraj_ADIC_EMU` (renamed folder; the `disc.id` files are those of IRB6400-0001). `02_`–`06_` are byte-identical to IRB6400-0001. `USER.SYS`, `USRSYS.CFG`, `ABB_LOAD.CMD`, `ABB_IOC.000` are not touched: the ABB_MC patches are in place (same file sizes) and `ABB_LOAD.CMD` carries no checksum for `ABB_MC`.

| File | sha256 in IRB6400-0001 | sha256 here |
|---|---|---|
| `DISK 2/ABB_MC.001` | `a89b46fd7420f2ef` | `a452ebfc281da6dd` |
| `DISK 3/ABB_MC.002` | `f1781479cc155bcf` | `b51436a2b492e61c` |
| `DISK 3/RLCOM.ENG` | `cc798d57b9a50c31` | `2b2855f449b89cf9` |

- `ReadTraj` is a **new** instruction in package `rlcom_opt1_sym`, rlcomts order `0x6D` through a trampoline in the dispatcher's error branch. **`WriteBin` is kept.**
- Code (1 204 B) in the space of the Independent Axes code (`rlind`, `0x2F3848`–`0x2F4160`). Its two packages are emptied (`0x2F2B0C`, `0x2F2B6C`), so **the Independent Axes option cannot be used** with this set. No disk in `ABB_FILES` installs it; check on the pendant that it is not installed after installing.
- Patches outside that space: package table `0x3C09A8` (4 B) and dispatcher `0x20AC7C` (8 B).
- `RLCOM.ENG`: new texts 69 `robtarget`, 70 `NPoints`, 71 `ReadTraj`.

Full list with hashes: `MANIFEST.txt`.

## Instruction (format v1, the one tested in the emulator)

```
ReadTraj IODevice, Buffer, NPoints [\Time];
  IODevice  iodev opened with Open "sio1:", ch \Bin
  Buffer    VAR robtarget array (1-D); filled from element 1
  NPoints   VAR num: points written (0 = none before the time limit)
  \Time     IN num, seconds (default 60)
```

Line format: records of 32 bytes, no header, no CRC: x, y, z, q1, q2, q3, q4 as big-endian IEEE float32, then cf1, cf4, cf6, cfx as signed bytes. `extax` is filled with 9E9 on the robot. It reads up to 7 records per internal message and chains while records keep coming (20 ms gap), until the buffer is full or `\Time` runs out. A cut inside a record ends the call. The agreed v2 format (33-byte frames with CRC-16, ACK/NAK, window of 40) is not in this set yet.

`RTTEST.PRG` was checked in the emulator before building this set: its declarations and `main` body, put into `USER.SYS` of an emulator-only copy of DISK 3 and run as a `POWER_ON` event routine after a full install of the IRB6400-0004 files, compile with no error and print exactly the expected values of the Test section (`RT1 s=` there is emulator time).

## Order of installation

As for IRB6400-0001: `01_` DISK 1, 2, 3, then `02_` … `06_`. `07_ReadTraj_Test_EMU` is **not an install disk**: it only holds the test program.

## Test

1. After installing, the system must reach normal operation with no new error in the event log. In the instruction pick lists `ReadTraj` may not appear (which lists show what is not verified); the real check is step 2. Programs that use `WriteBin` must still load.
2. Load `RTTEST.PRG` from `07_ReadTraj_Test_EMU/DISK 1` (Program → File → Open). If it loads with no error, the compiler knows `ReadTraj` and its parameters.
3. Connect the PC to `sio1:`, start `RTTEST`, and within 30 s run `python PC/rt_send.py <port> --baud <sio1 baud>`.
4. Expected on the pendant (the same as in the emulator): `RT1 n=10`, `x1=500`, `x10=513.5`, `q1=0.707107`, `cf1=-1`, `RT1 s=` (time of the first call, includes the wait until the PC sends), `RT2 n=2`, `y2=-24.75`, `q3=1`, `RT3 n=0`, `RTTEST: end`.
5. If `RT1 n` is 7 instead of 10, or any value is wrong, try `--gap 0.3` (pause after each 7 records) and note the result: it says whether bytes are lost when they arrive in one burst.

Write down any error number shown on the pendant; that is what tells where it failed.

## Open points

- Not tested on a robot. Not verified that nothing else checks `ABB_MC` (the emulator does not run the main computer EPROM).
- Real time per internal round trip: unknown (the emulator counts instructions, not ms).
- Size of the robot's serial receive buffer: unknown (step 5).
