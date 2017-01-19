#!/usr/bin/env fish

if test -z "$argv"
        echo "No db file specified" >&2
        exit 1
end

set -x BOT_TOKEN '305738431:AAGX3OX8O4ONZaK19N3GETJMSUXuuTcJWrE'
set USER_ID '229028828'
r4rbot-exe $argv | tee -a ~/logs/r4r.log | ./bot.bash $USER_ID
