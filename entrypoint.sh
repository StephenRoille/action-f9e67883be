#!/bin/bash
# exit immediately on error
set -e

if [ -z "$GITHUB_EVENT_PATH" ];
then
    echo environment variable "GITHUB_EVENT_PATH" required
    exit 1
else
    echo success: "$GITHUB_EVENT_PATH"
fi

echo "$@"
ls -la /
ls -la /github
cat "$GITHUB_EVENT_PATH"
# echo jq '.commits[].message, .head_commit.message' < "$GITHUB_EVENT_PATH" | grep -i "$@"

if jq '.commits[].message, .head_commit.message' < "$GITHUB_EVENT_PATH" | grep -i "$@";
then
    echo "found keyword '$@' in commit message"
    VERSION=$(date +%F.%s)

    DATA="$(printf '{"tag-name":"v%s", ' $VERSION)"
    DATA="$DATA $(printf '"target_commitish":"master",')"
    DATA="$DATA $(printf '"name":"v%s",' $VERSION)"
    DATA="$DATA $(printf '"body":"Automated release based on keyword: %s",' "$@")"
    DATA="$DATA $(printf '"draft":false, "prerelease":false}')"
    URL="https://api.github.com/repos/$GITHUB_REPOSITORY/releases?access_token=$GITHUB_TOKEN"
    echo $DATA
    echo $URL
    echo $DATA | http POST $URL | jq .
else
    echo "nothing to process"
fi
