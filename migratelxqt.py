#!/usr/bin/env python3
import subprocess
import os
import sys
import time

if len(sys.argv) == 1:
    subprocess.run(["killall", "lxqt-panel"])
    time.sleep(0.5)
    subprocess.Popen(["lxqt-panel"])
    exit(0)

filepath = sys.argv[1]
if not os.path.exists(filepath):
    exit(0)

config_contents = ""
with open(filepath, "r") as f:
    config_contents = f.read()

config_contents = config_contents.replace("/var/lib/snapd/desktop/applications/firefox_firefox.desktop", "/usr/share/applications/firefox.desktop")

with open(filepath, "w+") as f:
    f.write(config_contents)
