<!-- generado por mk_install_set_readtraj.py -->
# Install set IRB6400-0003 (S4, BaseWare 2.1/07) = IRB6400-0001 + `ReadTraj`, substitution (replaces WriteBin) — EMU

**Modified ABB_MC. Not tested on a real controller.** Made by `emu/mk_install_set_readtraj.py` of the repo `Proyecto-Futuro/abb-s4-baseware-lab` (analysis: `docs/readtraj-implementacion.md`). It works in that repo's emulator (full install, `ReadTraj` called from a RAPID program, points received byte-exact). Built at Rafa's request to test installing it on the robot.

**Before installing:** full backup of the controller (programs, system parameters, `BACKUP` from the pendant) and the `IRB6400-0001` set at hand to go back.

## What changes against IRB6400-0001

Only the files below, in `01_BaseWare_OS_2.1_3HAB2333-1_07_ReadTraj_SUST_EMU` (renamed folder; the `disc.id` files are those of IRB6400-0001). `02_`–`06_` are byte-identical to IRB6400-0001. `USER.SYS`, `USRSYS.CFG`, `ABB_LOAD.CMD`, `ABB_IOC.000` are not touched: the ABB_MC patches are in place (same file sizes) and `ABB_LOAD.CMD` carries no checksum for `ABB_MC`.

| File | sha256 in IRB6400-0001 | sha256 here |
|---|---|---|
| `DISK 2/ABB_MC.001` | `a89b46fd7420f2ef` | `23ef4e2bb6098bcd` |
| `DISK 3/ABB_MC.002` | `f1781479cc155bcf` | `0e25f339bd073e8f` |
| `DISK 3/RLCOM.ENG` | `cc798d57b9a50c31` | `e26f188c9eb44dd9` |

- `ReadTraj` takes the place of **`WriteBin`**: same definition slot, rlcomts order `0x68`. **`WriteBin` no longer exists** in this set; a program that uses it will not load.
- Code (1 082 B) in the space of the old `WriteBin` code, `0x2DA01E`–`0x2DA652`. Patches outside that space: definition `0x2D8F04` (22 B) and rlcomts entry `0x20B1B8` (6 B).
- `RLCOM.ENG`: text 31 `WriteBin` → `ReadTraj`; new texts 69 `robtarget`, 70 `NPoints`.

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

1. After installing, the system must reach normal operation with no new error in the event log. In the instruction pick lists `ReadTraj` may not appear (which lists show what is not verified); the real check is step 2. A program that uses `WriteBin` must now fail to load.
2. Load `RTTEST.PRG` from `07_ReadTraj_Test_EMU/DISK 1` (Program → File → Open). If it loads with no error, the compiler knows `ReadTraj` and its parameters.
3. Connect the PC to `sio1:`, start `RTTEST`, and within 30 s run `python PC/rt_send.py <port> --baud <sio1 baud>`.
4. Expected on the pendant (the same as in the emulator): `RT1 n=10`, `x1=500`, `x10=513.5`, `q1=0.707107`, `cf1=-1`, `RT1 s=` (time of the first call, includes the wait until the PC sends), `RT2 n=2`, `y2=-24.75`, `q3=1`, `RT3 n=0`, `RTTEST: end`.
5. If `RT1 n` is 7 instead of 10, or any value is wrong, try `--gap 0.3` (pause after each 7 records) and note the result: it says whether bytes are lost when they arrive in one burst.

Write down any error number shown on the pendant; that is what tells where it failed.

## Open points

- Not tested on a robot. Not verified that nothing else checks `ABB_MC` (the emulator does not run the main computer EPROM).
- Real time per internal round trip: unknown (the emulator counts instructions, not ms).
- Size of the robot's serial receive buffer: unknown (step 5).
