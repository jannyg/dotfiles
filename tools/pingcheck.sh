#!/bin/bash
 ping 8.8.8.8 | grep --line-buffered -E 'time=|Request timeout|No route' | awk -F'time=' '{
       if ($0 ~ /Request timeout/ || $0 ~ /No route/) {
           printf "\033[31mRequest timeout\033[0m\n"
       } else {
           time_str = $2
           match(time_str, /[0-9.]+/)
           time_val = substr(time_str, RSTART, RLENGTH) + 0

           if (time_val >= 200)
               color = "\033[31m"  # Red
           else if (time_val >= 100)
               color = "\033[33m"  # Yellow
           else
               color = "\033[32m"  # Green

           printf "%stime=%s\033[0m\n", color, time_str
       }
       fflush()
   }'

