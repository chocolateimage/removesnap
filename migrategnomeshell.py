#
# This script will be run automatically inside of "removesnap.sh", you
# do not need to run this script yourself
#


import subprocess

schema = "org.gnome.shell"
name = "favorite-apps"

subprocess.run(["gsettings", "reset", schema, name])
proc = subprocess.run(["gsettings", "get", schema, name], stdout=subprocess.PIPE)
apps = proc.stdout.decode().strip()
apps = apps.replace("firefox_firefox", "firefox")
apps = apps.replace("thunderbird_thunderbird", "thunderbird")
apps = apps.replace("snap-store_snap-store", "gnome-software")
apps = apps.replace("snap-store_ubuntu-software", "gnome-software")
subprocess.run(["gsettings", "set", schema, name, apps])
