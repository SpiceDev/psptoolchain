#!/bin/bash
# psp-pkg-config.sh by carstene1ns (dev f4ke de)

# Exit on errors
set -e

# Download the source code.
clone_git_repo github.com pspdev psp-pkgconf

# Enter the source directory.
cd psp-pkgconf


# overwrite the config.guess file so it knows about aarch64
curl 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD' \
  -H 'Accept: text/plain' \
  --insecure \
  -o config.guess

# Build and install.
make -j $(num_cpus)
make install
