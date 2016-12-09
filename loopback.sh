# It's not necessary to do this on Linux, so check that we're on OS X before continuing.
if [ "$(uname)" == "Darwin" ]; then
    # This loopback alias allows access to OS X hosts from inside a container. 10.254.254.254
    # is a private IP likely to be unused. As is, the alias will not survive a reboot.
    # Borrowed from https://forums.docker.com/t/access-host-not-vm-from-inside-container/11747/10.
    sudo ifconfig lo0 alias 10.254.254.254

    # This will check for a "docker.host" entry in your hosts file. It's created if it doesn't
    # exist, so you can use URLs like "http://docker.host:8000" in your service configuration.
    if ! grep -q "docker.host" /etc/hosts; then
        # Using tee to write to /etc/hosts because using >> to append isn't allowed, even as root.
        # See http://stackoverflow.com/a/550808.
        echo "10.254.254.254 docker.host" | sudo tee -a /etc/hosts > /dev/null
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if ! grep -q "docker.host" /etc/hosts; then
        echo "127.0.0.1 docker.host" | sudo tee -a /etc/hosts > /dev/null
    fi
fi
