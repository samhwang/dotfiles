# Testcontainers can't find colima's socket on its own, and inside the VM the daemon socket is the standard path.
if type colima > /dev/null; then
    export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
    export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
fi
