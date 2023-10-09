# IC Design 23Fall HW2
##### author : B10901176 蔡弘祥

### Before Running
```shell
source tool.sh
```

### How To Compile
```shell
cd [.sp file location]
hspice [spice file]
```
- Since hspice command will generate some files, cd into an appropriate directory is suggested

### How To Check Waveform
```shell
nWave &
```
1. And2
    1. Input waveform: v(ina), v(inb)
    2. Output waveform: v(out)
2. FA1
    1. Input waveform: v(ina), v(inb), v(inci),
    2. Output waveform: v(outco), v(outs)
