"""ReadTraj install test, PC side (format v1: 32-byte records, no header, no CRC).

    pip install pyserial
    python rt_send.py COM1 --baud 9600            # Windows
    python rt_send.py /dev/ttyUSB0 --baud 9600    # Linux

The baud rate must be the one configured for sio1 on the robot. Start RTTEST on the robot first;
it waits up to 30 s. Sends the same 12 points as the emulator test, so the pendant should show:
    RT1 n=10  x1=500  x10=513.5  q1=0.707107  cf1=-1
    RT2 n=2   y2=-24.75  q3=1
    RT3 n=0
Record i: x=500+1.5i, y=-2.25i, z=700-i, quaternion cycling (1,0,0,0)/(0.7071068,0,0.7071068,0)/(0,0,1,0),
cf1=-1+i%3, cf4=0, cf6=1, cfx=i%2; 7 big-endian IEEE float32 + 4 signed bytes.
--gap adds a pause (s) after every 7 records, in case the robot loses bytes when they arrive in one
burst (then RT1 will show n=7 instead of 10: that is expected with --gap).
"""
import argparse, struct, time
import serial


def rec(i):
    q = [(1.0, 0.0, 0.0, 0.0), (0.7071068, 0.0, 0.7071068, 0.0), (0.0, 0.0, 1.0, 0.0)][i % 3]
    return struct.pack('>7f4b', 500.0 + 1.5 * i, -2.25 * i, 700.0 - i, *q, -1 + i % 3, 0, 1, i % 2)


ap = argparse.ArgumentParser()
ap.add_argument('port')
ap.add_argument('--baud', type=int, default=9600)
ap.add_argument('--n', type=int, default=12)
ap.add_argument('--gap', type=float, default=0.0)
a = ap.parse_args()
with serial.Serial(a.port, a.baud, bytesize=8, parity='N', stopbits=1, timeout=1) as s:
    t0 = time.time()
    for i in range(a.n):
        s.write(rec(i))
        if a.gap and i % 7 == 6:
            s.flush(); time.sleep(a.gap)
    s.flush()
    print('sent %d records (%d bytes) in %.3f s; first record: %s'
          % (a.n, 32 * a.n, time.time() - t0, rec(0).hex(' ')))
