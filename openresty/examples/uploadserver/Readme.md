cd examples/uploadserver
sh start.sh
curl -X POST -F 'file=@"conf/mime.types";filename="first_upload_file"' http://localhost:8181/upload
ls -l download
