docker build \
  --add-host=gitlab.com:172.24.22.100 \
  --build-arg  TZ="Asia/Hongkong" \
  -t debian-buster:latest .
