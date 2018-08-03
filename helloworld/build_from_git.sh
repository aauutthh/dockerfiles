build_and_test()
{
    local tagname=$1
    shift
    docker build -t $tagname $@ --no-cache https://github.com/aauutthh/dockerfiles.git#master:helloworld
    docker images
    docker run -it --rm $tagname
    docker image rm $tagname
}

build_noargs()
{
    # 不传递--build-arg ,则镜像默认输出hello
    local tagname=helloworld/helloworld:noargs
    build_and_test $tagname 
}

build_with_args()
{
    # 传递--build-arg ,则镜像输出world
    local tagname=helloworld/helloworld:hasargs
    build_and_test $tagname --build-arg passarg="world" 
}

#build_noargs
build_with_args

