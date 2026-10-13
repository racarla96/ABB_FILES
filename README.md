# ABB_FILES

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

## Origen de los últimos tres lotes integrados

| Lote | Resultado |
|---|---|
| `ABB System Disks` (BaseWare 3.0, serie IRB2400-0399, 2000) | Añadidos 3HAB2375-1/47, 3HAB2379-2/21 y 3HAB2380-1/02. TPT 3.0 era idéntico a 3HAB2377-1/47 (descartado). |
| `ABB Track Work Folder` (descarga de Drive, 2021) | Añadido 3HAB2343-1/03. Los otros 3 (AdvFunc 2.1, SysPar 2.1.04, ArcWare 2.1) eran idénticos a 3HAB2344-1/00, 3HAB2337-1/04 y 3HAB2347-1/02. |
| `irb6400_s4_bw2.0` (backup del robot IRB6400-2562, 2007) | Añadidos 3HAB2319-1/08 (revisión nueva) y 3HAB2331-1/00 (2) (SYSPAR con ficheros reales; el original está vacío). Basic 2.0 y AdvFunc 2.0 eran idénticos. |

La comparación se hizo por hash del contenido de cada disquete (ignorando `disc.id`, que cambia con el nº de serie). Las carpetas originales de los tres lotes se conservan en local pero están en `.gitignore`.

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
