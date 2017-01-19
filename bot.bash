#!/usr/bin/env bash

if [[ -z "$@" ]]; then
        echo "Error: Did not provide User/Chat ID!" >&2
        exit 1
fi

if [[ -z "$BOT_TOKEN" ]]; then
        echo "Error: No bot token found." >&2
        exit 1
fi

user_id=$@[0]

while IFS= read -r line; do
        url=$(echo "$line" | cut -f 2 | sed 's/\//%2f/g' | sed 's/\:/%3a/g')
        request=$(printf "https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s" "$BOT_TOKEN" $user_id $url)
        curl -g "$request" >&2
done
