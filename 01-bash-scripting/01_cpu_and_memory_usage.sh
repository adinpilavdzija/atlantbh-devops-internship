#!/bin/bash

get_user_cpu_usage() {
  top -l 1 | awk '/CPU usage/ {print $3}' | cut -d '%' -f 1
}

get_sys_cpu_usage() {   
  top -l 1 | awk '/CPU usage/ {print $5}' | cut -d '%' -f 1
}

get_memory_usage() {
  vm_stat | awk '/Pages active/ {print $3*4096*0.000000001}' # pages to gigabytes
}

user_cpu_usage="$(get_user_cpu_usage)"
sys_cpu_usage="$(get_sys_cpu_usage)"
memory_usage="$(get_memory_usage)"

echo "User CPU Usage: ${user_cpu_usage}%"
echo "System CPU Usage: ${sys_cpu_usage}%"
echo "Memory Usage: ${memory_usage} GB"
