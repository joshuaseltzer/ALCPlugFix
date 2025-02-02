#!/bin/bash

echo "Uninstalling ALCPlugFix.  Root user is required."

# check if the root filesystem is writeable (starting with macOS 10.15 Catalina, the root filesystem is read-only by default)
if sudo test ! -w "/"; then
    echo "Root filesystem is not writeable.  Remounting as read-write and restarting Finder."
    mount -uw /
    killall Finder
fi

sudo rm /usr/bin/ALCPlugFix
sudo rm /usr/bin/hda-verb
sudo launchctl unload -w /Library/LaunchDaemons/good.win.ALCPlugFix.plist
sudo launchctl remove good.win.ALCPlugFix
sudo rm /Library/LaunchDaemons/good.win.ALCPlugFix.plist

echo "Done!"
exit 0