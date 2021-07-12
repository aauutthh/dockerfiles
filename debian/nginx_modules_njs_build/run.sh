if [ ! -e 'tip.tar.gz' ];then
  wget http://hg.nginx.org/njs/archive/tip.tar.gz
fi

docker run -it --rm --name njs_build \
  -v `pwd`:/data \
  debian-buster bash -l
