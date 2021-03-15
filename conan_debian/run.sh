mkdir -p .conan
docker run -it --rm -v `pwd`/.conan:/root/.conan conan:buster-1.0 bash
