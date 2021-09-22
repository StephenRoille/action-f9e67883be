#!/bin/bash
# exit immediately on error
set -e
if echo "$*" | grep -i -q fix;
then
    echo This is a fix
else
    echo nothing to process
fi
