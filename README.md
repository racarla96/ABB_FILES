# ABB_FILES

*[English version](README.en.md)*

Backup personal y preservación de los disquetes de sistema (boot disks) de controladores **ABB S4 / S4C** (BaseWare / RobotWare 2.0, 2.1 y 3.0) para robots IRB 1400/2400/3400/4400/6400. Repositorio privado.

## Estructura

Cada programa (`3HABxxxx-y/rev`) sigue el mismo patrón:

```
3HABxxxx-y_rev/
├── 3HABxxxx-y_rev/      # contenido extraído, una carpeta por disquete (DISK 1, DISK 2, ...)
├── 3HABxxxx-y_rev.zip   # mismo contenido comprimido
└── 3HABxxxx-y_rev.md    # notas (origen, serie del robot, etc.)
```

- `/` del número de programa se sustituye por `_` en el nombre de carpeta.
- Sufijo `(2)`: segunda copia del mismo programa/revisión con contenido distinto (otra fecha o origen).
- `disc.id` de cada disquete contiene número de programa, nº de serie del robot, fecha de generación y etiqueta.
- `3HAB2300-2_00` no es un disco de arranque: es la herramienta MS-DOS *S4 Program Update* (ver su `.md`).

## Tabla de programas

| Program no. / rev. | Description | Version | No. of disks | Month/Year | Available |
|---|---|---|---|---|---|
| 3HAB2300-2/00 | S4 Program Update | — | 1 | 02/1998 | Yes |
| 3HAB2316-1/13 | Basic 2.0 | 2.0 | 3 | 02/1998 | Yes |
| 3HAB2317-1/05 | Basic CommWare 2.0 | 2.0 | 3 | 02/1996 | Yes |
| 3HAB2317-1/13 | Basic CommWare 2.0 | 2.0 | 3 | 02/1998 | Yes |
| 3HAB2318-1/09 | IRB 1400 2400 3400 4400 2.0 | 2.0 | 2 | 02/1998 | Yes |
| 3HAB2319-1/03 | IRB 6400 Elmo/Siemens 2.0 | 2.0 | 3 | 02/1996 | Yes |
| 3HAB2319-1/08 | IRB 6400 Elmo/Siemens 2.0 (newer rev.) | 2.0 | 2 | 02/1998 | Yes |
| 3HAB2321-1/00 | Advanced Functions 2.0 | 2.0 | 1 | 11/1995 | Yes |
| 3HAB2322-1/00 | Multitasking 2.0 | 2.0 | 1 | 09/1997 | Yes |
| 3HAB2330-1/08 | IRB 1400 2400 DCLink6 2.0 | 2.0 | 2 | 02/1998 | Yes |
| 3HAB2331-1/00 | System Parameters 2.0 (empty SYSPAR) | 2.0 | 2 | 02/1998 | Yes |
| 3HAB2331-1/00 (2) | System Parameters 2.0 (full .CFG files, robot IRB6400-2562) | 2.0 | 1 | 06/2007 | Yes |
| | | | | | |
| 3HAB2333-1/07 | BaseWare OS 2.1 | 2.1 | 3 | 03/1998 | Yes |
| 3HAB2333-1/08 | BaseWare OS 2.1 | 2.1 | 2 | 05/2022 | Yes |
| 3HAB2334-1/08 | BaseWare OS RAP 2.1 | 2.1 | 2 | 03/2002 | Yes |
| 3HAB2337-1/04 | System Parameters 2.1 | 2.1 | 1 | 05/2022 | Yes |
| 3HAB2337-1/04 (2) | System Parameters 2.1 | 2.1 | 1 | 03/1998 | Yes |
| 3HAB2338-1/06 | IRB 1400 2400 3400 4400 2.1 | 2.1 | 1 | 05/2022 | Yes |
| 3HAB2340-1/04 | IRB 6400 2.1 | 2.1 | 1 | 05/2019 | Yes |
| 3HAB2342-1/04 | IRB 6400 2.1 | 2.1 | 1 | 03/1998 | Yes |
| 3HAB2343-1/03 | IRB 2400 M96 540 2.1 | 2.1 | 1 | 02/1998 | Yes |
| 3HAB2344-1/00 | Advanced Functions 2.1 | 2.1 | 1 | 05/2022 | Yes |
| 3HAB2344-1/00 (2) | Advanced Functions 2.1 | 2.1 | 1 | 03/1998 | Yes |
| 3HAB2346-1/01 | Multitasking 2.1 | 2.1 | 1 | 05/2022 | Yes |
| 3HAB2347-1/02 | ArcWare 2.1 | 2.1 | 1 | 05/2022 | Yes |
| 3HAB2351-1/03 | SpotWare + GlueWare + Advanced Functions 2.1 | 2.1 | 1 | 02/2019 | Yes |
| 3HAB2356-1/03 | Teach Pendant Text 2.1 | 2.1 | 2 | 05/2019 | Yes |
| 3HAB2356-1/03 (2) | Teach Pendant Text 2.1 | 2.1 | 2 | 03/1998 | Yes |
| | | | | | |
| 3HAB2375-1/47 | BaseWare OS 3.0 | 3.0 | 4 | 12/2000 | Yes |
| 3HAB2377-1/47 | Teach Pendant Text A 3.0 | 3.0 | 2 | 05/2022 | Yes |
| 3HAB2379-2/21 | IRB 1400 2400 3400 4400 3.0 | 3.0 | 1 | 11/2000 | Yes |
| 3HAB2380-1/02 | Advanced Functions 3.0 | 3.0 | 1 | 11/2000 | Yes |
| | | | | | |
| 3HAB2319-3/05 | IRB 6400 M96 | 2.0 | — |   | No |   |
| 3HAB2323-1/00 | ArcWare 2.0 | 2.0 | — |   | No |   |
| 3HAB2324-1/00 | ArcWare Plus 2.0 | 2.0 | — |   | No |   |
| 3HAB2325-1/00 | SpotWare 2.0 (includes Advanced Functions) | 2.0 | — |   | No |   |
| 3HAB2326-1/00 | SpotWare Plus 2.0 (includes Advanced Functions and Multitasking) | 2.0 | — |   | No |   |
| 3HAB2327-1/02 | Serial Link RAP 2.0 | 2.0 | — |   | No |   |
| 3HAB2328-1/02 | Weld Timer Interface 2.0 | 2.0 | — |   | No |   |

## Formato de `disc.id` y validación del nº de serie

Resumen de un análisis de ~135 ficheros `DISC.ID` (59 únicos) de sets de BaseWare/RobotWare 2.0 y 2.1 (en estos S4, BW y RW son la misma cosa). Confirmado además por otros usuarios con BW 3.0 para S4 y con Basic M94A. **Sin probar en un controlador real** (validado contra una réplica exacta del parser). Usar solo con equipos y discos propios.

### Resumen

- Un `DISC.ID` es una cabecera de texto más una cola binaria de 214–247 bytes que parece ruido.
- La cola es relleno aleatorio con el nº de serie del robot escondido en posiciones fijas. La línea `Serial  no …` de la cabecera es **decorativa**.
- Todo `install.cmd` de BW/RW 2.x empieza con `registrate -path flp1:disc.id`. Si el serie del disco no coincide con el del controlador: **"Invalid disc id"**.

### Estructura

- **Cabecera ASCII** con CRLF, terminada en CRLF CRLF. `registrate` solo busca la línea `Program no …` y luego `Boot discette label text:…`.
- **Cola binaria.** El parser hace `fseek(-193, SEEK_END)`, lee un byte, salta `17-i` bytes y repite hasta 17 caracteres o un 0. Cada carácter es `serial[i] = (byte + 0xA7 - 2*i) & 0xFF`. El serie debe tener más de 3 caracteres.
- No se lee nada más de la cola. En los 59 discos es relleno uniforme en `0x5B–0xBF`, sin `00`, `0A`, `0D` ni `1A`.

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

Ejemplo (set BW 2.1 de un IRB1400-2405): los bytes en esas posiciones son `A2 AD 9F 90 95 93 95 94 9B 9F 9D A4 71`, que decodifican a `IRB1400-2405` más el nulo final. En los 59 discos únicos el serie decodificado coincide con el de la cabecera. Una variante que trabaja sobre el volcado hexadecimal del fichero (`bytes.fromhex(...)`) usa exactamente el mismo algoritmo y también funciona.

### Qué hace el controlador (código 68k de `ABB_MC` de una imagen BW/RW 2.0, a.out con entrada en 0x42000)

- Handler de `registrate` en `0x26ed30`, parser en `0x2c292e`, comparación en `0x2c2baa`, rutina de registro en `0x2c2a3e`.
- Si existe `ram1disk:sys.id`, compara 12 bytes del disco con su clave `SystemId`. Si difieren: "Invalid disc id".
- Si no existe, lo crea con las secciones `System:`, `Product:` y `Function:` y escribe `SystemId` con el serie del disco. **El primer disco de una instalación limpia fija la identidad del sistema**; los siguientes se comparan contra ella. Por eso hay que evitar registrar primero un disco con otro serie.
- También registra el `Program no` y la etiqueta del disco como producto.
- Método: concatenar `ABB_MC.000/.001/.002`, leer la cabecera a.out (base 0x42000) y desensamblar con capstone en modo M68K 040.

### Preguntas abiertas

- Formato exacto de las líneas de `sys.id` (¿hay comando de consola, serie o FTP para leer `ram1disk:`?).
- Los discos antiguos sin serie (1998/2002): el código exige más de 3 caracteres. ¿Eran para otra versión de BW o se instalaban de otro modo?
- BW/RW 3.x en S4 usa `disc.id` (confirmado), pero **BW 3.0 para S4C usa un disco-llave con una *keystring*** (mecanismo distinto, sin analizar). ¿Es estática por unidad como el serie, o un checksum/tiempo?
- ¿Algo más lee `DISC.ID` o `sys.id` (opciones, Teach Pendant, RAPID, herramientas de servicio)? Solo se encontró un lector en `ABB_MC`.
- ¿Con qué herramienta se fabricaron los discos? La cabecera lleva `Boot unit no 0 Make cmd 4 <fecha>` y el relleno parece sembrado con la hora.
- Discos de instalación a medida para un controlador propio: ¿algo más que el serie debe coincidir?

### Herramienta en este repo: `tools/discid.py`

Decodifica, comprueba y **genera** ficheros `disc.id` a partir de un nº de serie.

```bash
# decodificar / comprobar contra la cabecera
python3 tools/discid.py decode "3HAB2316-1_13/3HAB2316-1_13/DISK 1/disc.id"
python3 tools/discid.py check 3HAB*/*/DISK*/disc.id

# generar un disc.id para otro robot
python3 tools/discid.py generate --serial IRB6400-1234 --program 3HAB2316-1/13 \
    --label "BaseWare OS 2.0" --disk 1 --of 3 --date "Wed May 04 08:16:27 2022" -o disc.id
```

Comprobado con los `disc.id` de este repo: 51 de 52 decodifican a un serie idéntico al de la cabecera (los de serie vacío, 1998, decodifican a cadena vacía). La excepción es `3HAB2343-1_03`: su cola decodifica a vacío mientras la cabecera dice `2400-3706`; el fichero está fechado en 2021, así que probablemente alguien editó la cabecera a mano sobre un disco originalmente sin serie.

El generador se ha verificado solo contra el propio decodificador, no contra un controlador real.

