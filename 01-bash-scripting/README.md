# Bash scripting 

# Task

- 01 - Write a script that gets CPU and Memory usage -> [Script](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/01-bash-scripting/01_cpu_and_memory_usage.sh)
- 02 - Write a script that tests connectivity to a list of websites and reports the status -> [Script1](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/01-bash-scripting/02_connectivity_list_of_websites_1.sh), [Script2](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/01-bash-scripting/02_connectivity_list_of_websites_2.sh)
- 03 - Write a script that pings a host and reports latency -> [Script](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/01-bash-scripting/03_ping_host_latency.sh)
- 04 - Write a script that traces the path of a network packet from the source to a destination -> [Script](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/01-bash-scripting/04_trace_path_network_packet.sh)
- 05 - Write a script that tests the DNS resolution time for a list of domains -> [Script1](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/01-bash-scripting/05_dns_resolution_time_list_of_domains_1.sh), [Script2](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/develop/01-bash-scripting/05_dns_resolution_time_list_of_domains_2.sh)

# Notes

- [Shell style guide](https://google.github.io/styleguide/shellguide.html)
- Always quote strings containing variables, command substitutions, spaces or shell meta characters, unless careful unquoted expansion is required or it’s a shell-internal integer (see next point).
- `$#` - special variable that represents the number of command-line arguments
- `"$@"` - special variable that represents all the command-line arguments passed to a script or function. It is often used to reference multiple arguments as a list.
- `"${websites[@]}"` - used to expand an array called websites into a list of elements, where each element is enclosed in double quotes; often used when you want to work with array elements that may contain spaces or other special characters
- `dig` - DNS lookup utility; performs the DNS resolution and capture the output
- `awk` - pattern scanning and processing language
- `awk '{print $4}'` - used to extract and print the fourth field (column) from each line of input data
- `cut -d '%' -f 1` - splits each line of input text using the '%' character as the delimiter and then print the first field (part) of each split line.
- `vm_stat` - macOS command-line utility that provides detailed information about virtual memory statistics on your system
- There is no need in using `--output /dev/null` together with `--silent`.
`--silent` flag will not show any output. `--output` is more used when you need to save something, for example like downloading a file.

## Curl

- `--output /dev/null` OR `-o /dev/null` # stdout redirected to /dev/null which discards any data that is written to it and reports back that the write operation is successful
- `--silent` OR `-s` # silent or quiet mode, without showing progress meter or error messages, makes curl mute
- `--fail` OR `-f` # fail silently (no output at all) on server errors
- `--write-out "%{time_total}\n"` OR `-w "%{time_total}\n"` # defines format of display on stdout after a completed and successful operation

## Exit codes

- `Exit 0` - Success  
- `Exit 1` - General errors, Miscellaneous errors, such as "divide by zero" and other impermissible operations  
- `Exit 2` - Misuse of shell builtins (according to Bash documentation). Example: empty_function() {}  
