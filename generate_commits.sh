#!/bin/bash

declare -A users
users["Alice"]="alice@example.com"
users["Bob"]="bob@example.com"
users["Charlie"]="charlie@example.com"
users["David"]="david@example.com"
users["Eve"]="eve@example.com"

for day in {1..30}; do
    for user in "${!users[@]}"; do
        echo "Fake content $RANDOM" >> "file_$day.txt"
        git add .
        GIT_AUTHOR_NAME="$user" GIT_AUTHOR_EMAIL="${users[$user]}" \
        GIT_COMMITTER_NAME="$user" GIT_COMMITTER_EMAIL="${users[$user]}" \
        git commit --date="2025-01-$day 12:00:00" -m "$user's commit on day $day"
    done
done


