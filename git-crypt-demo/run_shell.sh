#!/bin/bash
mkdir -p /data/gnupg_test
docker run -it --rm \
  -v /data/gnupg_test:/data \
  -v `pwd`:/data/root \
  git-on-debian bash -l
