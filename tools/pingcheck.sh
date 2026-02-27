#!/bin/bash
 ping 8.8.8.8 | grep --line-buffered 'time=' | awk -F'time=' '{
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
       fflush()
   }'

