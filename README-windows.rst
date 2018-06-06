Open edX Devstack on Windows (Alpha)
====================================

System Requirements
-------------------

* Windows 10 1803 (Spring 2018)

  * This has been tested on the Spring 2018 release of Windows 10 only

* Developer Mode enabled https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development

  * Needed to allow git to create symlinks

* Docker for Windows

* Python 2 for windows
  * python must be in the path (i.e. enable "Add python.exe to Path" in installer)

* Git and Git bash from git-scm.org

* Make from ezwinports installed

  * Download make without guile from https://sourceforge.net/projects/ezwinports/files/

  * Copy the contents of the make zip file into C:\Program Files\Git\mingw64\usr\bin\

Provisioning Devstack
---------------------

Follow the instructions in the mian README, but skip "make requirements"
