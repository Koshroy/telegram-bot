#!/usr/bin/env fish

if test -z "$argv"
        echo "Error: Did not provide User/Chat ID!" >&2
        exit 1
end

if test -z "$BOT_TOKEN"
        echo "Error: No bot token found." >&2
        exit 1
end

set user_id (echo $argv | cut -d' ' -f 1)

while read -l line
        set -l url (echo "$line" | cut -f 2 | sed 's/\//%2f/g')
        set -l request (printf "https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s" $BOT_TOKEN $user_id $url)
        curl -g "$request"
end
