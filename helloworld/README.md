# Dockerfile  helloworld

## how to build

1. build command

    ```shell
    docker build -t helloworld:witharg \
        --build-arg passarg="world" --no-cache \
        https://github.com/aauutthh/dockerfiles.git#master:helloworld
    ```
