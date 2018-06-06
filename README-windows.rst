Open edX Devstack on Windows (Alpha)
====================================

System Requirements
-------------------

* Windows 10 1803 (Spring 2018)

  * This has been tested on the Spring 2018 release of Windows 10 only

* Developer Mode enabled https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development

  * Needed to allow git to create symlinks

* Docker for Windows

Configuring Docker for Windows
------------------------------

Follow instructions at https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly

Setup Ubuntu
------------

Install make and pip in WSL Ubuntu

.. code:: sh

    apt install make python-pip

Optional Increased Security
---------------------------

*Untested*

Use npipe relay to avoid opening docker tcp port to the world
https://blogs.msdn.microsoft.com/commandline/2017/12/08/cross-post-wsl-interoperability-with-docker/
