To install this snapshot of Open edX devstack (no network access required):

1. Copy the entire "devstack_snapshot" directory to your computer.  You'll
   need about 35 GB free (9 GB for the copied files and 26 GB more for the
   subsequent installation.

2. Unmount the flash drive, remove it, and return it to the workshop staff
   so someone else can use it.

macOS
-----

3. If you don't already have Docker 17.06 CE or later installed, install
   it from "devstack_snapshot/Docker.dmg".

4. From a terminal, enter the "devstack_snapshot" directory and run
   "bash mac.sh".

Linux
-----

3. Make sure you have Docker 17.06 CE or later installed.  If not, see
   https://www.docker.com/community-edition for installation instructions.

4. Make sure you have docker-compose 1.9.0 or later installed.  If not,
   you can get it by running the following:

      sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose

5. From a terminal, enter the "devstack_snapshot" directory and run
   "bash linux.sh".  Partway through you'll be prompted for your password
   to grant sudo access (to run docker commands); provide it as needed.

Windows
-------

3. If you don't already have Docker 17.06 CE or later installed, install
   it from "devstack_snapshot/Docker for Windows Installer.exe".

4. Follow the instructions at
   https://github.com/edx/devstack/blob/master/README-windows.rst
   (Unlike the macOS and Linux installations above, this will require
   a network connection).

Open edX devstack isn't fully working on Windows yet, but if you are
running Windows 10 you can help us diagnose and fix the remaining
problems.  If you're running an older version of Windows, please ask
for help choosing a task that can be completed without installing
devstack.

All Operating Systems
---------------------

Done!  Try visiting http://localhost:18000/ for the LMS and
http://localhost:18010/ for Studio.  It may take a minute or two for the
services to finish initializing and start responding to requests.
