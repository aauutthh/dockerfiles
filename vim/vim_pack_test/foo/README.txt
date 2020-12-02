# foo packages

该包只用于演示，没有实际功能

## 说明

1. 目录结构
    
    ```text
    foo
    ├── opt
    │   ├── fooopt
    │   │   ├── autoload
    │   │   │   └── foo
    │   │   │       └── auto.vim
    │   │   └── plugin
    │   │       └── opt.vim
    │   └── fooother
    │       └── autoload
    │           └── other
    │               └── auto.vim
    ├── README.txt
    └── start
        └── foostart
            └── plugin
                └── foo.vim
    ```

1. 安装方式

    `cp -r foo ~/.vim/pack/foo` 

1. 加载顺序说明

    1. 加载`~/.vimrc`
    1. 扫描`~/.vim/pack/*/start`, 并将start下的package目录加入到rtp(:help rtp)
        本例相当于`set rtp+=~/.vim/pack/foo/start/foostart`
    1. 自动运行foostart中`plugin`目录中的脚本`foo.vim`
    1. `foo.vim`脚本中有`packadd fooopt`, 将`~/.vim/pack/*/opt/fooopt`加入到rtp, 并执行`fooopt/plugin`下的脚本(嵌套执行)
    1. `fooopt/plugin`下有脚本`opt.vim`,执行之(嵌套在foo.vim执行流之中)
    1. `opt.vim`脚本中有`packadd fooother`, 将`~/.vim/pack/*/opt/fooopt`加入到rtp, 并执行`fooother/plugin`下的脚本(嵌套执行)
    1. `opt.vim`脚本有`call other#auto#hello()`, 将在所有`<rtp>/autoload`下查找`other/auto.vim`, 找到其中的`other#auto#hello`函数并调用
    1. 回到`foo.vim`
    1. `foo.vim`脚本中有`call foo#auto#hello()`, 将在所有`<rtp>/autoload`下查找`foo/auto.vim`, 找到其中的`foo#auto#hello`函数并调用

