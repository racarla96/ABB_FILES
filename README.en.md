# ABB_FILES

*[Versión en español](README.md)*

Personal backup and preservation of the system (boot) floppy disks for **ABB S4 / S4C** controllers (BaseWare / RobotWare 2.0, 2.1 and 3.0) for IRB 1400/2400/3400/4400/6400 robots. Private repository.

## Structure

Every program (`3HABxxxx-y/rev`) follows the same pattern:

```
3HABxxxx-y_rev/
├── 3HABxxxx-y_rev/      # extracted contents, one folder per floppy (DISK 1, DISK 2, ...)
├── 3HABxxxx-y_rev.zip   # same contents, zipped
└── 3HABxxxx-y_rev.md    # notes (origin, robot serial, etc.)
```

- The `/` in the program number is replaced by `_` in the folder name.
- `(2)` suffix: a second copy of the same program/revision with different contents (other date or origin).
- Each floppy's `disc.id` holds the program number, robot serial number, build date and label.
- `3HAB2300-2_00` is not a boot disk: it is the MS-DOS tool *S4 Program Update* (see its `.md`).

## Program table

| Program no. / rev. | Description                                                      | Version | No. of disks | Month/Year | Available |
| ------------------ | ---------------------------------------------------------------- | ------- | ------------ | ---------- | --------- |
| 3HAB2300-2/00      | S4 Program Update                                                | —       | 1            | 02/1998    | Yes       |
| 3HAB2316-1/13      | Basic 2.0                                                        | 2.0     | 3            | 02/1998    | Yes       |
| 3HAB2317-1/05      | Basic CommWare 2.0                                               | 2.0     | 3            | 02/1996    | Yes       |
| 3HAB2317-1/13      | Basic CommWare 2.0                                               | 2.0     | 3            | 02/1998    | Yes       |
| 3HAB2318-1/09      | IRB 1400 2400 3400 4400 2.0                                      | 2.0     | 2            | 02/1998    | Yes       |
| 3HAB2319-1/03      | IRB 6400 Elmo/Siemens 2.0 (M94A)                                 | 2.0     | 3            | 02/1996    | Yes       |
| 3HAB2319-1/08      | IRB 6400 Elmo/Siemens 2.0 (M94A, newer rev.)                     | 2.0     | 2            | 02/1998    | Yes       |
| 3HAB2321-1/00      | Advanced Functions 2.0                                           | 2.0     | 1            | 11/1995    | Yes       |
| 3HAB2322-1/00      | Multitasking 2.0                                                 | 2.0     | 1            | 09/1997    | Yes       |
| 3HAB2330-1/08      | IRB 1400 2400 DCLink6 2.0                                        | 2.0     | 2            | 02/1998    | Yes       |
| 3HAB2331-1/00      | System Parameters 2.0 (empty SYSPAR)                             | 2.0     | 2            | 02/1998    | Yes       |
| 3HAB2331-1/00 (2)  | System Parameters 2.0 (full .CFG files, robot IRB6400-2562)      | 2.0     | 1            | 06/2007    | Yes       |
| **BaseWare/RobotWare 2.1** | | | | | |
| 3HAB2333-1/07      | BaseWare OS 2.1                                                  | 2.1     | 3            | 03/1998    | Yes       |
| 3HAB2333-1/08      | BaseWare OS 2.1                                                  | 2.1     | 2            | 05/2022    | Yes       |
| 3HAB2334-1/08      | BaseWare OS RAP 2.1                                              | 2.1     | 2            | 03/2002    | Yes       |
| 3HAB2337-1/04      | System Parameters 2.1                                            | 2.1     | 1            | 05/2022    | Yes       |
| 3HAB2337-1/04 (2)  | System Parameters 2.1                                            | 2.1     | 1            | 03/1998    | Yes       |
| 3HAB2338-1/06      | IRB 1400 2400 3400 4400 2.1                                      | 2.1     | 1            | 05/2022    | Yes       |
| 3HAB2340-1/04      | IRB 6400 Elmo/Siemens 2.1 (M94A)                                 | 2.1     | 1            | 05/2019    | Yes       |
| 3HAB2342-1/04      | IRB 6400 M96 2.1                                                 | 2.1     | 1            | 03/1998    | Yes       |
| 3HAB2343-1/03      | IRB 2400 M96 540 2.1                                             | 2.1     | 1            | 02/1998    | Yes       |
| 3HAB2344-1/00      | Advanced Functions 2.1                                           | 2.1     | 1            | 05/2022    | Yes       |
| 3HAB2344-1/00 (2)  | Advanced Functions 2.1                                           | 2.1     | 1            | 03/1998    | Yes       |
| 3HAB2346-1/01      | Multitasking 2.1                                                 | 2.1     | 1            | 05/2022    | Yes       |
| 3HAB2347-1/02      | ArcWare 2.1                                                      | 2.1     | 1            | 05/2022    | Yes       |
| 3HAB2351-1/03      | SpotWare + GlueWare + Advanced Functions 2.1                     | 2.1     | 1            | 02/2019    | Yes       |
| 3HAB2356-1/03      | Teach Pendant Text 2.1                                           | 2.1     | 2            | 05/2019    | Yes       |
| 3HAB2356-1/03 (2)  | Teach Pendant Text 2.1                                           | 2.1     | 2            | 03/1998    | Yes       |
| **BaseWare/RobotWare 3.0** | | | | | |
| 3HAB2375-1/47      | BaseWare OS 3.0                                                  | 3.0     | 4            | 12/2000    | Yes       |
| 3HAB2377-1/47      | Teach Pendant Text A 3.0                                         | 3.0     | 2            | 05/2022    | Yes       |
| 3HAB2379-2/21      | IRB 1400 2400 3400 4400 3.0                                      | 3.0     | 1            | 11/2000    | Yes       |
| 3HAB2380-1/02      | Advanced Functions 3.0                                           | 3.0     | 1            | 11/2000    | Yes       |
| **No disk available** | | | | | |
| 3HAB2319-3/05      | IRB 6400 M96                                                     | 2.0     | —            |            | No        |
| 3HAB2323-1/00      | ArcWare 2.0                                                      | 2.0     | —            |            | No        |
| 3HAB2324-1/00      | ArcWare Plus 2.0                                                 | 2.0     | —            |            | No        |
| 3HAB2325-1/00      | SpotWare 2.0 (includes Advanced Functions)                       | 2.0     | —            |            | No        |
| 3HAB2326-1/00      | SpotWare Plus 2.0 (includes Advanced Functions and Multitasking) | 2.0     | —            |            | No        |
| 3HAB2327-1/02      | Serial Link RAP 2.0                                              | 2.0     | —            |            | No        |
| 3HAB2328-1/02      | Weld Timer Interface 2.0                                         | 2.0     | —            |            | No        |

### IRB 6400: M94A vs M96 configuration

The `IRB 6400` model disks exist for two hardware generations and are **not interchangeable**:

| | `3HAB2340-1/04` (and `3HAB2319-1/xx` in 2.0) | `3HAB2342-1/04` (and `3HAB2319-3/05` in 2.0) |
|---|---|---|
| Generation | M94A: IRB 6400 "Elmo/Siemens" | M96 |
| `install.cmd` asks | model **and** axis-4 motor type (Elmo or Siemens) | model only |
| Models | 2.25-75 (PE), 2.4-120, 2.4-150, 2.8-120, S2.9-120, 3.0-75, 2.4-balB (7) | 2.4-120, 2.4-150, 2.8-120, S2.9-120, 3.0-75, 2.4-balB (6, no 2.25-75) |
| `IRBCFG` files | `M64xxxx*.CFG` (Elmo) and `S64xxxx*.CFG` (Siemens), 42 files | `P64xxxx*.CFG`, 18 files |
| Text in `install.cmd` | "IRB 6400 Elmo/Siemens S4 2.1" | "IRB 6400 M96 S4 2.1" |

How to choose: if the axis-4 motor label says Elmo or Siemens and the robot is an early-series one (e.g. IRB6400-1262/1263/3518 with `3HAB2319` Elmo/Siemens 2.0), use the M94A one. Deduced from the `install.cmd` files; not verified on an M96 robot.

## `disc.id` format and serial number validation

Summary of an analysis of ~135 `DISC.ID` files (59 unique) from BaseWare/RobotWare 2.0 and 2.1 sets (on these S4 systems BW and RW are the same thing). Additionally confirmed by other users with BW 3.0 for S4 and with Basic M94A. **Not tested on a real controller** (validated against an exact replica of the parser). Use only with your own equipment and disks.

### Summary

- A `DISC.ID` is a text header plus a 214–247 byte binary tail that looks like noise.
- The tail is random filler with the robot's serial number hidden at fixed positions. The `Serial  no …` line in the header is **decorative**.
- Every BW/RW 2.x `install.cmd` starts with `registrate -path flp1:disc.id`. If the disk's serial doesn't match the controller's: **"Invalid disc id"**.

### Structure

- **ASCII header** with CRLF line endings, ending in CRLF CRLF. `registrate` only looks for the `Program no …` line and then the `Boot discette label text:…` line.
- **Binary tail.** The parser does `fseek(-193, SEEK_END)`, reads one byte, skips `17-i` bytes, and repeats until 17 characters or a 0. Each character is `serial[i] = (byte + 0xA7 - 2*i) & 0xFF`. The serial must be longer than 3 characters.
- Nothing else in the tail is read. Across the 59 disks it is uniform random filler in `0x5B–0xBF`, with no `00`, `0A`, `0D` or `1A`.

```python
POS = [0]
for i in range(16):
    POS.append(POS[-1] + 18 - i)   # 0,18,35,51,66,80,93,105,116,126,135,143,150,...

def disc_serial(data: bytes) -> str:
    base = len(data) - 193
    out = bytearray()
    for i in range(17):
        c = (data[base + POS[i]] + 0xA7 - 2 * i) & 0xFF
        if c == 0:
            break
        out.append(c)
    return out.decode('ascii')
```

Example (BW 2.1 set from an IRB1400-2405): the bytes at those positions are `A2 AD 9F 90 95 93 95 94 9B 9F 9D A4 71`, which decode to `IRB1400-2405` plus the terminating null. Across all 59 unique disks the decoded serial matches the header serial. A variant working on a hex dump of the file (`bytes.fromhex(...)`) uses exactly the same algorithm and also works.

### What the controller does (68k code of `ABB_MC` from a BW/RW 2.0 image, a.out with entry point 0x42000)

- `registrate` handler at `0x26ed30`, parser at `0x2c292e`, comparison at `0x2c2baa`, registration routine at `0x2c2a3e`.
- If `ram1disk:sys.id` exists, it compares 12 bytes from the disk against its `SystemId` key. If they differ: "Invalid disc id".
- If it doesn't exist, it creates it with the sections `System:`, `Product:` and `Function:` and writes `SystemId` with the disk's serial. **The first disk of a clean installation sets the system's identity**; every later disk is compared against it. So never register a disk with a different serial first.
- It also records the disk's `Program no` and label as a product.
- Method: concatenate `ABB_MC.000/.001/.002`, read the a.out header (base 0x42000) and disassemble with capstone in M68K 040 mode.

### Open questions

- The exact line format inside `sys.id` (is there a console, serial or FTP route to read `ram1disk:`?).
- ~~The old blank-serial disks (1998/2002)~~: **solved.** They are *generic* revision disks (empty serial) that cannot boot any controller; they are "authorized" with `UPDATE.EXE` (`3HAB2300-2_00`, see below), which copies the serial from an original disk of the robot.
- BW/RW 3.x on S4 uses `disc.id` (confirmed), but **BW 3.0 for S4C uses a key disk with a *keystring*** (a different, unanalysed mechanism). Is it static per unit like the serial, or a checksum/time-based value?
- Does anything else read `DISC.ID` or `sys.id` (options, Teach Pendant, RAPID, service tools)? Only one reader was found in `ABB_MC`.
- ~~Which tool made the disks?~~ **Partly solved:** `UPDATE.EXE` (`3HAB2300-2_00`, Borland C++ 1991) contains the `disc.id` writer (format strings `Boot  disk %d (%d)`, `Program no %s`, `Serial  no %s`, the copyright text and a date formatter `%s %s %02d %02d:%02d:%02d %4d`) and imports `srand`/`rand`/`time`, consistent with time-seeded filler. It does not contain the string `Boot unit no … Make cmd`, so that line is produced by ABB's original manufacturing tool and `UPDATE.EXE` only preserves it. To do: disassemble the write routine to confirm.
- Custom install floppies for your own controller: does anything besides the serial need to match?

### Tool in this repo: `tools/discid.py`

Decodes, checks and **generates** `disc.id` files from a serial number.

There is also an install-free web version: open `tools/discid.html` in a browser (decode/check, change the serial of several `disc.id` files, and generate a new one; everything runs locally).

```bash
# decode / check against the header
python3 tools/discid.py decode "3HAB2316-1_13/3HAB2316-1_13/DISK 1/disc.id"
python3 tools/discid.py check 3HAB*/*/DISK*/disc.id

# generate a disc.id for another robot
python3 tools/discid.py generate --serial IRB6400-1234 --program 3HAB2316-1/13 \
    --label "BaseWare OS 2.0" --disk 1 --of 3 --date "Wed May 04 08:16:27 2022" -o disc.id
```

Tested on this repo's `disc.id` files: 51 of 52 decode to a serial identical to the header's (the blank-serial 1998 ones decode to an empty string). The exception is `3HAB2343-1_03`: its tail decodes to empty while the header says `2400-3706`; the file is dated 2021, so someone probably edited the header by hand on a disk that originally had no serial.

The generator has only been verified against the decoder itself, not against a real controller.
