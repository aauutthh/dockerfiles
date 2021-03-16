# git crypt 仓库文件加密

## 仓库加密示例

1. 示例

    ```shell
    cd docker
    ./build.sh
    cd ..
    # 进入docker shell
    ./run_shell.sh

    # 生成私钥或导入私钥, 以user-id为 daniel作示例
    # 该私钥用于演示加密，请不要作其他用途(特别是不要在host主机上信任该密钥)，避免给你造成损失
    # gpg生成私钥请另行参考: https://www.devdungeon.com/content/gpg-tutorial
    gpg --import /data/root/.my_secret_key

    # 设置无限信任daniel的公钥
    gpg --edit-key daniel
    > trust
    > 5

    # 创建仓库
    mkdir mysecret
    cd mysecret
    git init

    # 初始化加密配置
    git crypt init

    # 使用gpg作为加密工具, 这一步需要在干净的workspace下进行，会提交一个.git-crypt目录到仓库
    git crypt add-gpg-user daniel

    # 添加加解密规则, 规则说明后附
    # cp .git-crypt/.gitattributes .
    cat > .gitattributes <<EOF
    * !filter !diff
    *.gpg binary
    secretfile filter=git-crypt diff=git-crypt
    *.key filter=git-crypt diff=git-crypt
    EOF

    # 任意添加文件
    echo "hello world"| tee msg.key | tee msg.txt

    # 提交代码
    git add .
    git commit -m "save files"

    # 检出代码到新目录
    cd ..
    git clone mysecret/.git new_dir
    cd new_dir

    # 查看文件，一个是加密的，一个是未加密的
    cat msg.*

    # 解密, 必须在gpg有原始密钥的机器上才可以
    git crypt unlock

    # 恢复成加密状态
    git crypt lock

    # 删掉gpg
    gpg --delete-secret-keys daniel

    # daniel密钥不存在 解密失败
    git crypt unlock
    ```

    规则说明:

    - 规则类似.gitignore
    - 第一行对任意文件不使用filter diff过滤器
    - 对于*.gpg按二进制文件处理
    - 对于其他匹配规则，使用git-crypt作为过滤器
