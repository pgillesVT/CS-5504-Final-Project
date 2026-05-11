# Instructions for generating project results:
Download ```https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v15.2.0-1/xpack-riscv-none-elf-gcc-15.2.0-1-linux-x64.tar.gz``` and extract in ~/tools
```export PATH=$HOME/tools/xpack-riscv-none-elf-gcc-15.2.0-1/bin:$PATH```
```riscv-none-elf-gcc -march=rv64gc -mabi=lp64d -O2 -ggdb3 -std=c99 -static libcompress.c -o riscv_compress```
```gcc -O2 -ggdb3 -std=c99 -static libcompress.c -o x86_compress```
```riscv-none-elf-gcc -march=rv64gc -mabi=lp64d -O2 -ggdb3 -std=c99 -static libbubble.c -o riscv_bubble```
```gcc -O2 -ggdb3 -std=c99 -static libbubble.c -o x86_bubble```
```<path_to_gem5.opt> -d riscv_compress_results riscv_multilevel.py```
```<path_to_gem5.opt> -d x86_compress_results multilevel_intel.py```
Comment out compress workload, comment in bubble workload in the python scripts
```<path_to_gem5.opt> -d riscv_bubble_results riscv_multilevel.py```
```<path_to_gem5.opt> -d x86_bubble_results multilevel_intel.py```
Run ```compile_results.sh``` to generate a full_stats.dat containing relevant stats
