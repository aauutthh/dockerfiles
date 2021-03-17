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

## nanoc 配置修改

1. Rules

    在`Ruels`文件中找到这部分规则，把前面的`#`去掉

    ```ruby
    compile '/**/*.md' do
      filter :kramdown, input: "GFM"
      layout '/default.*'
    
      if item.identifier =~ '**/index.*'
        write item.identifier.to_s
      else
        write item.identifier.without_ext + '/index.html'
      end
    end
    ```

    注意:

    > `input: "GFM" 这个是原文没有的，需要添加。 其作用是对GFM风格(Github Flavored Markdown)的支持


## 参考

[https://nanoc指南][1]

[1]: https://nanoc.ws/doc/tutorial/
