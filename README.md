# Podman+Systemd example: Simpleserver

This project shows in a simple example how to enable systemd control for your
podman containers. It is intended as a template for more complex setups.

The idea for this repository came to me from reading
[this excellent blog post](https://www.redhat.com/sysadmin/podman-shareable-systemd-services)
from my colleague [Valentin Rothberg](https://github.com/vrothberg).

## Howto

Ensure that you run this with a user that can control systemctl, then just
build the example container with:

    $ make

Install it with:

    $ make install

And then you can control it with:

    $ systemctl enable simpleserver
    $ systemctl start simpleserver
    $ systemctl stop simpleserver
