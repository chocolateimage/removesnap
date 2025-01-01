#
# This script will be run automatically inside of "removesnap.sh", you
# do not need to run this script yourself
#

import os
home = os.path.expanduser("~")
profiles_path = home + "/.mozilla/firefox/profiles.ini"
if not os.path.exists(profiles_path):
    print("No Firefox profile present, not migrating profiles.")
    exit(0)

profile = None
profiles_contents = ""
with open(profiles_path, "r") as f:
    profiles_contents = f.read()
    for line in profiles_contents.splitlines():
        if line.startswith("[Install"):
            print("Firefox profile already migrated")
            exit(0)
        if line.startswith("Path="):
            profile = line[5:]

if profile == None:
    print("Firefox profile not found, launching Firefox picker")
    print("Please select your correct profile (normally ending with \".default\")")
    os.system("firefox -p")
    exit(0)

to_add = f"[Install4F96D1932A9F858E]\nDefault={profile}\n\n"

with open(profiles_path, "w+") as f:
    f.write(to_add + profiles_contents)

print(f"Migrated Firefox profile \"{profile}\"")
