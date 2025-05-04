#!/bin/sh

KERNEL () {
	kernel=$(uname -r)
}

OS () {
	. /etc/os-release
	os=$NAME
}

CPU () {
	# https://stackoverflow.com/questions/23367857/accurate-calculation-of-cpu-usage-given-in-percentage-in-linux
	# https://www.linuxhowtos.org/System/procstat.htm
	local cpu_info_prev=$(cat /proc/stat | head -n 1)
	local previdle=$(echo $cpu_info_prev | awk '{print $4}')
	local previowait=$(echo $cpu_info_prev | awk '{print $5}')
	sleep 0.1
	local cpu_info=$(cat /proc/stat | head -n 1)
	local idle=$(echo $cpu_info_prev | awk '{print $4}')
	local iowait=$(echo $cpu_info_prev | awk '{print $5}')

	local PrevIdle=$(echo "$previdle+$previowait" | bc)
	local Idle=$(echo "$idle+$iowait" | bc)
	local PrevNonIdle=$(echo $cpu_info_prev | awk '{print $2 "+" $3 "+" $4 "+" $5 "+" $6 "+" $7 "+" $8}' | bc)
	local NonIdle=$(echo $cpu_info | awk '{print $2 "+" $3 "+" $4 "+" $5 "+" $6 "+" $7 "+" $8}' | bc)

	local PrevTotal=$(echo "$PrevIdle+$PrevNonIdle" | bc)
	local Total=$(echo "$Idle+$NonIdle" | bc)

	local totald=$(echo "$Total-$PrevTotal" | bc)
	local idled=$(echo "$Idle-$PrevIdle" | bc)
	
	local cpupc=$(echo "scale=2; ($totald - $idled) / $totald" | bc)
	cpu="$cpupc%"
}

MEMORY () {
	memory_total=$(cat /proc/meminfo | grep 'MemTotal' | tail -n 1 | awk '{ print $2 }')
	memory_free=$(cat /proc/meminfo | grep 'MemFree' | tail -n 1 | awk '{ print $2 }')
	memory_available=$(cat /proc/meminfo | grep 'MemAvailable' | tail -n 1 | awk '{ print $2 }')

	memory_total_gb=$(echo "scale=2; $memory_total/1000000" | bc -l)
	memory_free_gb=$(echo "scale=2; $memory_free/1000000" | bc -l)
	memory_available_gb=$(echo "scale=2; $memory_available/1000000" | bc -l)

	memory_used=$(echo "scale=2; $memory_total_gb-$memory_available_gb" | bc -l)
	memory_pc_gb=$(echo "scale=2; $memory_used/$memory_total_gb*100" | bc -l)
	memory="$memory_pc_gb%, $memory_used/$memory_total_gb GB"
}

DISK () {
	disk=$(df -h | head -2 | tail -1 | awk '{print $3 "/" $2 " - " $5}')
}

PROCESSES() {
	memtop=$(top -b -n 2 -d 0.2 -o -%MEM | tail -5 | awk '{print $10 "% " $12}')
	cputop=$(top -b -n 2 -d 0.2 -o -%CPU | tail -5 | awk '{print $10 "% " $12}')
}

SHOW () {
	echo ""
	echo "mtop - TIME: $(date '+%H:%M:%S')"
	echo "OS / KERNEL: $os, $kernel"
	echo "SYSTEM: cpu: $cpu - mem: $memory - disk: $disk"
	echo "PROCESSES (sort by cpu):"
	echo -e "$cputop"
	echo "PROCESSES (sort by ram):"
	echo -e "$memtop"
	echo ""
}


Main () {
	KERNEL
	OS
	DISK
	while [ true ]; do
		CPU
		MEMORY
		PROCESSES

		SHOW
		# sleep 3
		break
	done
}

Main

