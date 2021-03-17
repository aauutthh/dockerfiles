# nanoc 创建gitlab doc

## getting start 起步

1. 构建镜象

    ```shell
    ./build.sh
    ```

1. 创建容器并执行

    ```shell
    ./run_shell.sh
    cd /data

    # 创建nanoc文档项目
    nanoc create-site tutorial

    # 进入项目并进行构建
    cd tutorial
    nanoc

    # 启动http服务(webrick)
    nanoc view -o 0.0.0.0
    ```

    浏览器打开: [文档地址 127.0.0.1:8383](http://127.0.0.1:8383)

## 参考

[https://nanoc指南][1]

[1]: https://nanoc.ws/doc/tutorial/
