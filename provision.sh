#!/bin/bash

EXTRA_TAGS=""

for tag in "$@"; do
    EXTRA_TAGS+="$tag,"
done

if [ -n "$EXTRA_TAGS" ]; then
    ansible-playbook main.yml --ask-become-pass --tags "$EXTRA_TAGS"
else
    ansible-playbook main.yml --ask-become-pass
fi
