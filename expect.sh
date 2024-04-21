#!/usr/bin/expect -f

spawn ./run_frac.sh

set prompt "Enter your choice: "

interact -o -nobuffer -re $prompt return
send -- "3\n"

interact -o -nobuffer -re $prompt return
send -- "3\n"

interact -o -nobuffer -re $prompt return
send -- "3\n"

interact -o -nobuffer -re $prompt return
send -- "3\n"

interact -o -nobuffer -re $prompt return
send -- "3\n"

interact -o -nobuffer -re $prompt return
send -- "3\n"

interact -o -nobuffer -re $prompt return
send -- "3\n"

expect eof