#!/usr/bin/bash
# This script replaces the desktop link executable to begin in incognito mode

sed -i 's/^Exec=.*$/Exec=chromium %U --incognito/' /usr/share/applications/chromium.desktop
