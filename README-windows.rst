Open edX Devstack on Windows (Alpha)
====================================

System Requirements
-------------------

* Windows 10 1803 (Spring 2018)

  * This has been tested on the Spring 2018 release of Windows 10 only

* NTFS file system (symlinks and MSYS2 won't work on FAT* partitions)

* Developer Mode enabled https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development

  * Needed to allow git to create symlinks

* Docker for Windows

* Git and Git bash from https://git-scm.com/

* Make from ezwinports installed

  * Download make without guile from https://sourceforge.net/projects/ezwinports/files/

  * Copy the contents of the make zip file into C:\\Program Files\\Git\\mingw64

Provisioning Devstack
---------------------

Follow the instructions in the main README. Run the make commands in git bash. Skip the "make requirements" step.
