# RAP in the S4 BaseWare 2.1 kernel — first pass

Method: `ABB_MC.000/.001` of `3HAB2334-1/08` (RAP) and `3HAB2333-1/08` (no RAP) unpacked with `tools/abb_mc_unpack.py`, then compared with `strings`. No disassembly yet (no 68k disassembler available offline). Nothing here was tested on a controller.

## Correction

Earlier string comparisons were made on the **LZO-compressed** files, so they only saw literal runs. The figures below are from the unpacked images (RAP 3 978 820 B, non-RAP 3 681 612 B). a.out, entry 0x42000, VxWorks (Wind River) based.

## Container format of ABB_MC.00x

- Text line `#! ABB FLEXIBLE AUTOMATION COMPRESS FORMAT [LZO1X] [10]`, then an 8-byte blank field.
- Chunks: 8-byte header (ASCII decimal compressed length, NUL padded) + LZO1X stream expanding to 10 240 bytes (the `[10]`).
- The unpacked `.000` is 2 252 800 B; concatenating `.000` + `.001` gives the image.

## What RAP is (from the strings)

- **RAP is Sun ONC RPC** (rpcgen-generated stubs, XDR) on top of VxWorks TCP/UDP: `clnttcp_create`, `clntudp_create`, `svc_tcp`, `portmap`, `PORT %d,%d,%d,%d,%d,%d`, `clnt_raw.c`. The non-RAP kernel has **zero** such strings; the RAP kernel has 15.
- RPC programs seen: `RAPRPC_FIL_PROGRAM` (version 1), `RAPRPC_SYNC_PROGRAM` (version 1); transports `raprpc_fts`, `raprpc_sts`.
- Modules (RCS headers, ABB sources `eci/classlib/…`): `rapsys` (+ tasks `rapsynts`, `rapdatts`, `rapsysts`, `rapsyst1`), `rapvar`, `rapcfg`, `rapgen`, `rappgm`, `rapfil`. Tasks started by `startup.cmd`: `rapsynts_main`, `rapdatts_main`, `rapts`, `rapts1`.
- Procedures (suffix `_1` = version 1), by module:
  - `rapgen`: `open`, `request_master`, `release_master`, `restart` (restart modes, "Cold start via RAP").
  - `rapvar`: `define_page`, `undefine_page`, `read_page`, `write_page`, `read_name`, `write_name`, `read_name_array`, `write_name_array`, `subscw_add`, `sponmsg` (variable access by name or by "page").
  - `rapcfg`: `load_parameters`, `save_parameters`, `reset_domain`.
  - `rappgm`: `delete_program` (RAPID program management); `rapfil`: `open` (file access).
- Host handling: "Configured RAP Hosts" and "Dynamic RAP Hosts" tables, boot parameters (`host inet`, `gateway inet`, `inet on ethernet/backplane`), error `RAP Error code %d`.
- Serial: both kernels have the same 16 `iocbase/sio*` channels. `slipdum.c` (a SLIP driver) is in both; RAP reaches the PC as IP over SLIP, consistent with forum posts that S4 uses SLIP.

## Consequence for the serial port question

The plain BaseWare kernel has no IP/RPC stack strings at all, so `sio1:` is just a character device for RAPID, as used in `ABB_IRB_6400_1262_FILES`. In the RAP kernel the SLIP/IP stack is present; a channel configured for it is not a free RAPID device.

## Second pass: disassembly (gdb-multiarch, 68040)

`gdb-multiarch` (already installed) disassembles the image: `set architecture m68k:68040`, `set gnutarget binary`, `exec-file`. The unpacked image is an a.out whose text starts at 0x42000 (file offset 0x20, header: text 0x37e010, data 0x4d614, bss 0x2f0aec, entry 0x42000); I rebased it by prefixing 0x42000 zero bytes. The CPU is a 68040 (`cinva`, `movec cacr` at the entry point).

Found by following the `svc_register(xprt, prog, vers, dispatch, proto)` call sites (arguments pushed right-to-left):

| RPC program | Version | Protocol | Dispatch | Name in strings |
|---|---|---|---|---|
| 300456 (0x49528) | 1 | TCP (6) | 0x371f0a | `RAPRPC_SYNC_PROGRAM` (task `rapsynts`) |
| 300457 (0x49529) | 1 | TCP (6) | 0x37247c | `RAPRPC_FIL_PROGRAM` (file access) |
| 100000 | 2 | (portmap) | 0x3aba88 | standard portmapper |

- 300458 is also referenced (0x350f7c, 0x3510a8), most likely the client side of the spontaneous-message callback (`rapvar_sponmsg`); not confirmed.
- Numbers 327684 and 327703-327737 appear as arguments in code at 0x2250b0-0x2292e0; their meaning is not determined.
- The SYNC dispatcher does not switch on the RPC procedure number: it copies a field of the request header and switches on an application command code. Codes seen: 0-5, 1001-1009, 1501-1502, 2001-2011 (matching the `ipc_message_dispatcher: RAPGEN/RAPVAR Command received` strings). Which range is which module is not mapped yet.

## Phase 1+2 results: command map and message layouts

Source: both dispatchers' compare trees plus the rpcgen-style `(xdr_argument, xdr_result, local_function)` triple that each case loads into `d4`, `d3`, `a2`. Scripts used (paths hard-coded to a scratch dir, kept for reference): `tools/rap_re/`.

**How to read the layouts.** XDR on the wire: every item is 4-byte big-endian; `short`/`enum`/`u16` also take 4 bytes; `str[N]` is a 4-byte length followed by the bytes padded to 4; `array` is a 4-byte count followed by elements. `H` is the common header `{i32, i32}`, the names in the debug strings are `head.userdef` and `head.data1` (first/second is not confirmed). Offsets in the XDR routines are offsets in the in-memory C struct, not wire offsets.

### Program 300456 (`RAPRPC_SYNC_PROGRAM`, TCP v1)

Command code 0 is the RPC null procedure. The dispatcher switches on a command code taken from the request header, not on the RPC procedure number.

| Code | Function (from debug strings) | Handler | Request (after RPC header) | Response |
|---|---|---|---|---|
| 1 | `rapgen_open` | 0x34d17e | `H i32` | `H i32` |
| 2 | `(none, replies constant)` | 0x34d2ba | `void` | `void` |
| 3 | `rapgen_request_master` | 0x34d3b6 | `H enum` | `H i32` |
| 4 | `rapgen_release_master` | 0x34d5ba | `H enum` | `H i32` |
| 5 | `rapgen_restart` | 0x34d74a | `H` | `H i32` |
| 1001 | `rapvar_read_name` | 0x3645fe | `H {str[80],str[80],u16,i16,i16}` | `H` |
| 1002 | `rapvar_write_name` | 0x3657be | `H {str[80],str[80],u16,i16,i16} <value>` (the value is a large union of RAPID data types; not expanded here) | `H i32` |
| 1003 | `rapvar_read_name_io` | 0x3643f0 | `H array(max=?, esz=0x4, elem=pea %pc@(0x36eb08))` | `H` |
| 1004 | `rapvar_read_name_array` | 0x364a4a | `H {str[80],str[80],u16,i16,i16} {i16,call 3a4e00}` | `H` |
| 1005 | `rapvar_write_name_array` | 0x365c0c | `H {str[80],str[80],u16,i16,i16} {i16,call 3a4e00} {}` | `H i32` |
| 1006 | `rapvar_read_page` | 0x364dc2 | `H enum {enum,{},call 36e918}` | `H` |
| 1007 | `rapvar_write_page` | 0x365ff2 | `H {enum,{},{call 36edb4,{}}}` | `H` |
| 1008 | `rapvar_define_page` | 0x36515a | `H {}` | `H` |
| 1009 | `rapvar_undefine_page` | 0x3654da | `H i16` | `H` |
| 1501 | `raptest_read` | 0x367e2a | `H {str[80],str[80],i32,i32,i32}` | `H` |
| 1502 | `raptest_write` | 0x367f2e | `H {str[80],str[80],i32,i32,i32} {call 3a4e54,i32,str[80]}` | `H i32` |
| 2001 | `rappgm_load_module` | 0x368a56 | `H i16 str[80]` | `H` |
| 2002 | `rappgm_save_module` | 0x368d68 | `H i16 str[80] {str[16],i16}` | `H i32` |
| 2003 | `rappgm_load_program` | 0x369056 | `H i16 str[80]` | `H i32` |
| 2004 | `rappgm_save_program` | 0x3692ec | `H i16 str[80]` | `H i32` |
| 2005 | `rappgm_prep_program` | 0x3695c2 | `H i16 str[16] i32 i32 i32` | `H i32` |
| 2006 | `rappgm_delete_program` | 0x36992e | `H i16` | `H i32` |
| 2007 | `rappgm_set_mode` | 0x369db2 | `H i16 i32 i32 i32` | `H i32` |
| 2008 | `rappgm_get_mode` | 0x36a088 | `H i16` | `H` |
| 2009 | `rappgm_start` | 0x36a3a6 | `H i16 str[16] i32 i32 i32 i16` | `H i32` |
| 2010 | `rappgm_stop` | 0x36a6cc | `H i16 i16` | `H i32` |
| 2011 | `rappgm_delete_module` | 0x369b1e | `H i16 {str[16],i16}` | `H i32` |


### Program 300457 (`RAPRPC_FIL_PROGRAM`, TCP v1)

| Code | Function (from debug strings) | Handler | Request (after RPC header) | Response |
|---|---|---|---|---|
| 3001 | `rapfil_open` | 0x36adf8 | `H str[unbounded] i32 i32` | `H` |
| 3002 | `rapfil_read` | 0x36b180 | `H i32 u32 u32` | `H` |
| 3003 | `rapfil_write` | 0x36b4c2 | `H i32 call 3a4ae8` | `H` |
| 3004 | `rapfil_close` | 0x36b796 | `H i32` | `H i32` |
| 3005 | `rapfil_delete` | 0x36c66c | `H str[unbounded]` | `H i32` |
| 3006 | `rapfil_rename` | 0x36c098 | `H str[unbounded] str[unbounded]` | `H i32` |
| 3007 | `rapfil_dir` | 0x36bc3e | `H str[unbounded] i32` | `H` |
| 3008 | `rapfil_list_devices` | 0x36c268 | `H` | `H i32 array(max=?, esz=0xc, elem=pea %pc@(0x3711cc))` |
| 3009 | `rapfil_close_all` | 0x36b94c | `H` | `H i32` |
| 4001 | `rapcfg_load_parameters` | 0x34ddf4 | `H str[100] str[100] i16` | `H i32` |
| 4002 | `rapcfg_save_parameters` | 0x34e0a8 | `H str[100] str[40]` | `H i32` |


### Observations

- Replies to the variable commands (`rapvar_*`) carry only the header and one status/long, so the data seems to come back by a separate callback (`rapvar_sponmsg`, `rapgen_open` reports a `port`), not in the RPC reply. Not confirmed.
- `rapgen_open` (code 1) takes `H i32`... see table; `request_master`/`release_master` take an `enum` resource: the same "resource" the strings print.
- Mapping of the field types of the sub-structures (e.g. the `str[80], str[80], u16, i16, i16` block of `rapvar_read_name`, probably task/module/variable plus indexes) is a guess from types only. Several nested types (`call 3a4e54`, `call 3a4ae8`, floats/doubles) were not decoded.
- Everything here is static analysis of the 3HAB2334-1/08 kernel; no traffic was captured and nothing was run against a robot.

## Phase 3: transport and how the link is brought up

Static analysis of the kernel (transport framework `trpfwk.c`, `rapsys_init`) plus the `SIO.CFG` schema (`com_mmc.cfg`, unpacked with `tools/abb_mc_unpack.py`; the `.cfg` files on the disks use the same LZO container).

**Configuration model (domain `SIO`, file `SIO.CFG`)**

| Section | Fields (from `com_mmc.cfg` and the kernel strings) |
|---|---|
| `COM_PHY_CHANNEL` | `Name` (`sio1:`, `printer1:`, `sio3:`, `sio4:`), `Type sio`, `Channel`, `Baudrate`, `Parity`, `NoOfBits`, `NoOfStopBits`, `RTS/CTSControl` |
| `COM_TRP_TYPE` / `COM_TRP` | transport instance: `Name`, `Type` (`none`, `XON/XOFF`, `SLIP`; the kernel also knows drivers `rtp1`, `rtp2`), `PhyChannel`, `LocalAdress`, `RemoteAdress`, `PortNo`. Defaults in the kernel: local `100.100.100.101`, remote `100.100.100.102`, `PortNo -1` (65535 also appears). |
| `COM_APP_TYPE` / `COM_APP` | application bound to a transport: `Name`, `Type` (the kernel compares it with `RAP`/`rap`), `Trp`, `SpSysEvent`, `EnableSUBSCW` |

**What the kernel does for each `COM_APP` entry of type `RAP`:** finds the `COM_TRP` named in `Trp`, prints `Configures: <app> (<type>) <trp> remote= '<..>' local= '<..>'`, looks up `rapsys_init` and calls it with the transport parameters. `rapsys_init` then:
- creates the SLIP interface with VxWorks `slipInit(unit, device, localAddr, remoteAddr, 0)` (unit number increments per host; debug string `slipInit : Device unit number = %d, Status = %d`);
- adds a route (`routeAdd`, debug string `routeAdd : Status = %d`);
- fills a table of at most 50 RAP hosts (`Configured RAP Hosts`) with local address, remote address and port number;
- the RPC servers of programs 300456/300457 are created with `svc_register` (TCP) and the on-board portmapper task `tPortmapd` (program 100000 v2) answers where they are.

So the physical picture is: **PC <-> RS-232 <-> `sio1:` <-> SLIP (point-to-point IP) <-> TCP <-> ONC RPC (portmapper -> programs 300456/300457)**. The robot is `LocalAdress`, the PC must use `RemoteAdress`, at the baud rate configured for the physical channel.

**Probable `SIO.CFG` fragment to enable RAP** (reconstructed from the schema and kernel strings; `COM_APP_TYPE` may or may not need an explicit `RAP` entry; not verified on a robot):

```
COM_TRP:
      -Name "slip1" -Type "SLIP" -PhyChannel "sio1:" -HostName "none" \
      -LocalAdress "100.100.100.101" -RemoteAdress "100.100.100.102" -PortNo -1
COM_APP:
      -Name "rap1" -Type "RAP" -Trp "slip1"
```

Do not reuse `sio1:` if RAPID already opens it (see the point-streaming project); use another channel or keep both uses apart.

**First test on a real robot (read-only), suggested order**
1. Back up the robot first (system and `SIO.CFG`). Change nothing else.
2. Configure as above, warm start, check the console for `Configures: ... remote= ... local= ...` and any `slipInit failed`.
3. PC side, Linux: `sudo slattach -p slip -s 9600 /dev/ttyUSB0 &` then `sudo ip addr add 100.100.100.102 peer 100.100.100.101 dev sl0; sudo ip link set sl0 up` (the `slip` kernel module may be missing on recent kernels; then bridge the serial line to a `tun` device in userspace).
4. `ping 100.100.100.101`, then `python3 tools/rap_probe.py 100.100.100.101`: asks the portmapper for programs 300456 and 300457 and calls the null procedure on each. Its encoding was only checked against a local fake server.
5. Only after that, try one harmless command from the table (for example `rappgm_get_mode`, code 2008) — not written yet.

## Phase 4: the missing pieces

**300458 is the PC-side callback program.** Both call sites (0x350f7c in `rap_create_client`, 0x3510a8 in the alternate path) are `clnttcp_create(&addr, 300458, 1, &sock, 0, 0)`: the **robot opens a TCP connection to the PC** and acts as RPC client of program 300458, version 1. Debug strings: `rap_create_client:B:clnttcp_create: PortNo= %d , Addr= %x`, `...:A:clnttcp_create: Clnt = %x`.

- The address is the peer of the incoming connection; the port comes from the request of command 1 (`rapgen_open`). The handler (0x34d17e) prints `head.userdef`, `head.data1` and `port` from its request (`H` + one `i32` = the PC's callback TCP port).
- So the session is: **PC** `rapgen_open(port=P)` to program 300456; the robot then connects back to **PC:P** (program 300458 v1) and uses it for replies and spontaneous messages (`rapvar_sponmsg`, `TransId` in the error strings). The PC therefore has to run a small RPC **server** on port P (no portmapper registration is needed if the client is created with an explicit port; not verified).
- Which procedures the robot calls on program 300458, and their XDR layouts, are **still unknown** (needs tracing the users of the client created by `rap_create_client`, e.g. around `rapvar_sponmsg_1_int` at 0x366ca4 and the `rapts` task).

**327684, 327703, 327722-327737 are not RPC numbers.** They appear as immediate arguments in a large function at 0x2250b0-0x2292e0 together with calls to internal routines, not as program numbers; they look like internal event/error identifiers (unconfirmed). 300000 (0x2159c2) also is not RAP.

**RAP is off by default.**
- The shipped `com_ext.cfg` (same in `3HAB2333-1/08` and `3HAB2334-1/08`) has empty `COM_APP_TYPE` and `COM_APP`, and only `printer1:` has a `COM_TRP` (`XON/XOFF`). The `SYSPAR/SIO.CFG` sets on the disks look the same.
- `startup.cmd` of the RAP disk starts the tasks `rapsynts`, `rapdatts`, `rapts` (priority 110) and `rapts1` (priority 50); the non-RAP disk lists them without `-auto`. `rapts`/`rapts1` are the tasks that run the RPC servers (`svc_run`); `rapts` waits for IPC messages and starts the server when it receives message type 301.
- Without a `COM_APP` entry of type `RAP` bound to a SLIP `COM_TRP`, `rapsys_init` is never called, and the servers do not come up.

**Errors:** `RAP Error code %d` strings are produced by a routine that maps codes 1401-1405 to messages (0x363f6e); the texts are in the kernel strings and can be added to the client later.

## Not known yet

- XDR argument layouts of each command, which command code belongs to which module, TCP port numbers (the portmapper assigns them), SLIP/IP addressing: need a deeper read of the handlers at 0x372000-0x372280 and the XDR routines, or a capture from a real link.
- How `COM_TRP` entries in `SIO.CFG` (types `none`, `XON/XOFF`, `SLIP`) tie to RAP hosts.
