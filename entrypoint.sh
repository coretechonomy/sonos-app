#!/bin/sh

set -e

xvfb-run --auto-servernum --server-args="-screen 0 1024x768x16" bash -c \
    "wine /tmp/etechonomy/${SETUP_EXE} & \
    pid=\$! && while kill -0 \$pid 2> /dev/null; do \
    xdotool key alt+i; \
    xdotool key alt+o; \
    sleep 5; \
    ls ~/.wine/drive_c/users/root/AppData/Local/Temp; \
    if [ -f ~/.wine/drive_c/users/root/AppData/Local/Temp/{C33D420C-BD73-4BE3-ADA8-F6B7D46E63B0}/${MSI_FILE} ]; then \
        mv ~/.wine/drive_c/users/root/AppData/Local/Temp/{C33D420C-BD73-4BE3-ADA8-F6B7D46E63B0}/${MSI_FILE} /tmp/etechonomy/${MSI_FILE}; \
        exit 0; \
    fi; \
    done && wait \$pid && echo 'Wine process finished'"
