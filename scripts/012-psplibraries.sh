#!/bin/bash
# psplibraries.sh by Takeshi Watanabe (takechi101010@gmail.com)

 ## clear CC and CXX
 unset CC
 unset CXX

 ## Exit on errors
 set -e

 ## Download the source code.
 clone_git_repo github.com pspdev psplibraries

 ## Enter the source directory.
 cd psplibraries


# overwrite the config.guess file so it knows about aarch64
curl 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD' \
  -H 'Accept: text/plain' \
  --insecure \
  -o config.guess

 ## Configure the build.
 ./libraries.sh
