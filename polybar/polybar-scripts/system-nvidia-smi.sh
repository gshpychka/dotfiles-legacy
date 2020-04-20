#!/bin/sh
nvidia-smi --query-gpu=utilization.gpu,utilization.memory,temperature.gpu,memory.free,power.draw --format=csv,noheader,nounits | awk '{split($0,a,", "); print "GPU "a[1]"% "a[3]"°C", "MEM "a[2]"% "a[4]"MB", a[5]"W"}'
