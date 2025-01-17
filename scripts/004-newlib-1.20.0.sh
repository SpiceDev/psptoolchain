#!/bin/bash
# newlib-1.20.0.sh by Naomi Peori (naomi@peori.ca)

 ## Exit on errors
 set -e

 ## Download the source code if it does not already exist.
clone_git_repo github.com pspdev newlib newlib-1_20_0-PSP

 ## Enter the source directory
 cd newlib

# overwrite the config.guess file so it knows about aarch64
curl 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD' \
  -H 'Accept: text/plain' \
  --insecure \
  -o config.guess


 ## Create and enter the build directory.
 mkdir build-psp
 cd build-psp

 ## Configure the build.
 ../configure --prefix="$PSPDEV" --target="psp" \
   --enable-newlib-iconv --enable-newlib-multithread --enable-newlib-mb

 ## Compile and install.
 make -j $(num_cpus) clean
 make -j $(num_cpus)
 make -j $(num_cpus) install
 make -j $(num_cpus) clean
