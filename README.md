# Build the libsecret git helper

Not all user environments have the necessary build tool to
make the libsecret git credential helper.  It does not come native
with the libsecret-tools package for some reason, so we build it
here in a Docker container where we can put whatever tools we need
into the container.

# Setup
This has been tested on Ubuntu 20.04 (focal).  It will likely
work on any system that has had libsecret installed and can
use containers.  You must also have an Internet connection or
access to Ubuntu package repositories.

1. Install Docker-ce or equivalent
2. Install libsecret-1-0 or equivalent on this OS
3. `./setup_git`
4. This sets up git to use the binary in this folder

# Login through a registry
You only need to set your remote to an HTTPS endpoint and
enter your credentials or Personal Access Token (e.g. GitHub)
and then everything is setup.

# Test
1. Change directory to this folder
2. `./git-credential-libsecret get`
3. A blank line appears.  Substitute the host name and login as appropriate
4. `protocol=https`
5. `host=github.com`
6. `username=GitLoginName`
7. Press Enter and the username/password typed in initially are shown

# Reset a password
You generally cannot update a password.  Easier is to let it expire or
revoke the token.  Generate a new password or token and enter it on the
next `push` or `pull`.

