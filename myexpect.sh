#! /usr/bin/expect
set timeout 30
spawn git clone -b hmi-hpfeeds https://github.com/illidanteam/illipot.git
expect "Username for 'https://github.com':"
send "lijingchn\r"
expect "Password for 'https://lijingchn@github.com':"
send "*********\r"
interact

