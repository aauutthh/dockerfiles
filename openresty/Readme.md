sh get.sh
docker build . -t openresty
docker run --rm -p 8181:8080 openresty
docker run --rm -p 8181:8080 -v nginx.conf:/data/openresty/workspace/conf/nginx.conf openresty
