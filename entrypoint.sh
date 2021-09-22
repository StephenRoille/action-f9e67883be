#!/bin/bash
set -e
if echo "$*" | grep -i -q fix;
then
    echo This is a fix
else
    echo nothing to process
fi
