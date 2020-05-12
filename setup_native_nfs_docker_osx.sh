#!/usr/bin/env bash
#
# Coppied from https://github.com/ajeetraina/docker101/tree/master/os/macOS/nfs
#

OS=`uname -s`

# Finding OS X version https://scriptingosx.com/2017/11/on-the-macos-version/
OSX_VERSION=$(sw_vers -productVersion)
OSX_CATALINA=10.15.*
IFS='.' read -r -a OSX_VERSION_ARRAY <<< "$OSX_VERSION"

if [ $OS != "Darwin" ]; then
  echo "This script is OSX-only. Please do not run it on any other Unix."
  exit 1
fi

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run with sudo/root. Please re-run without sudo." 1>&2
  exit 1
fi

echo ""
echo " +-----------------------------+"
echo " | Setup native NFS for Docker |"
echo " +-----------------------------+"
echo ""

echo "WARNING: This script will shut down running containers, delete volumes, delete current native NFS configs on this Mac"
echo ""
echo -n "Do you wish to proceed? [y]: "
read decision

if [ "$decision" != "y" ]; then
  echo "Exiting. No changes made."
  exit 1
fi

echo ""

if ! docker ps > /dev/null 2>&1 ; then
  echo "== Waiting for docker to start..."
fi

open -a Docker

while ! docker ps > /dev/null 2>&1 ; do sleep 2; done

echo "== Stopping running docker containers..."
docker-compose down > /dev/null 2>&1

osascript -e 'quit app "Docker"'

echo "== Resetting folder permissions..."
U=`id -u`
G=`id -g`
sudo chown -R "$U":"$G" .

echo "== Setting up nfs..."

# Handle `/Users` path differently for releases Catalina (10.15.*) or newer since this changed with the Catalina release.
if [[ "$OSX_VERSION" == $OSX_CATALINA || "$OSX_VERSION_ARRAY[0]" -ge 11 ]]
then
   LINE="/System/Volumes/Data/Users -alldirs -mapall=$U:$G localhost"
else
   LINE="/Users -alldirs -mapall=$U:$G localhost"
fi

FILE=/etc/exports
grep -xqF -- "$LINE" "$FILE" || sudo echo "$LINE" | sudo tee -a $FILE > /dev/null

NFS_LINE="nfs.server.mount.require_resv_port = 0"
NFS_FILE=/etc/nfs.conf
grep -qF -- "$NFS_LINE" "$NFS_FILE" || sudo echo "$NFS_LINE" | sudo tee -a $NFS_FILE > /dev/null

echo "== Restarting nfsd..."
sudo nfsd restart

echo "== Restarting docker..."
open -a Docker

while ! docker ps > /dev/null 2>&1 ; do sleep 2; done

echo ""
echo "SUCCESS! Now go run your containers 🐳"
