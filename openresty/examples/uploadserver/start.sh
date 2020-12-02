mkdir -p download
chmod 777 download

if [ $# -eq 0 ]; then
dockeropt=-d
else
  if [ $1 = '-d' ]; then
    dockeropt=-d
    shift
  fi
fi

docker run --rm $dockeropt --name fileserver -p 8181:8080 \
    -v `pwd`/conf:/data/openresty/workspace/conf \
    -v `pwd`/download:/data/download/ \
    openresty $@
