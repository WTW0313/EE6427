## Encode:

```powershell
tmn -i ./football_cif.yuv -x 3 -b 149 -S 0 -O 0 -I 31 -q 31 -o football_cif_31.yuv -B football_cif_31.263
```

## Decode:

```powershell
tmndec -o5 -l football_cif_02.263 football_cif_02_decode.yuv
```

## Fixed bitrate:

```powershell
tmn -i ./football_cif.yuv -x 3 -b 149 -S 0 -O 0 -r 2450000 -R 30 -o football_cif_fixedB_2450.yuv -B football_cif_fixedB_2450.263
```

