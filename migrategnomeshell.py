#!/usr/bin/env python3
import subprocess

schema = "org.gnome.shell"
name = "favorite-apps"

subprocess.run(["gsettings", "reset", schema, name])
proc = subprocess.run(["gsettings", "get", schema, name], stdout=subprocess.PIPE)
apps = proc.stdout.decode().strip()
apps = apps.replace("firefox_firefox", "firefox")
apps = apps.replace("thunderbird_thunderbird", "thunderbird")
apps = apps.replace("snap-store_snap-store", "gnome-software")
subprocess.run(["gsettings", "set", schema, name, apps])
