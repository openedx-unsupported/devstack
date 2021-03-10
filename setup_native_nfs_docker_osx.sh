#!/usr/bin/env bash
#
# Coppied from https://github.com/ajeetraina/docker101/tree/master/os/macOS/nfs
#

OS=`uname -s`
MAC_VERSION=`sw_vers -productVersion | awk -F. '{ printf "%s.%s", $1, $2; }'`;
CATALINA_VERSION="10.15";

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

# From catalina the directory has changed.
if (( $(echo "$MAC_VERSION < $CATALINA_VERSION" |bc -l) )); then
  LINE="/Users -alldirs -mapall=$U:$G localhost"
else
  LINE="/System/Volumes/Data -alldirs -mapall=$U:$G localhost"
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
