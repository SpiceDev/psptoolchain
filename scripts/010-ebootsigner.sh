#!/bin/bash
# ebootsigner.sh by Sam Hegarty (samr.hegarty@gmail.com)
# Modification of script by Naomi Peori (naomi@peori.ca)

 ## Exit on errors
 set -e

 ## Download the source code if it does not already exist.
 clone_git_repo github.com pspdev ebootsigner

 ## Enter the source directory.
 cd ebootsigner
 

# overwrite the config.guess file so it knows about aarch64
curl 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD' \
  -H 'Accept: text/plain' \
  --insecure \
  -o config.guess


 ## Build and install
 make -j $(num_cpus)
 make -j $(num_cpus) install
