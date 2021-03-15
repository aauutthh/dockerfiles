FROM centos:7.6.1810 AS base

# 通过build传参
ARG homedir=/
ARG expose=8080

#修改系统时区为东八区
ENV TZ="Asia/Shanghai" \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

COPY ["yum.repos.d.tgz", "/etc/"]

# && pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple \
RUN set -ex \
    && cd /etc \
    && tar -zxf yum.repos.d.tgz

RUN set -ex \
    && mkdir ~/.pip \
    && { echo "[global]"; \
    echo "index = http://pypi.server.com/pypi "; \
    echo "index-url = http://pypi.server.com/simple "; \
    echo "trusted-host= pypi.server.com "; \
    } > ~/.pip/pip.conf \
    && { echo "# common profile"; \
    echo "set -o vi"; \
    echo "alias cp='cp -i'"; \
    echo "alias rm='rm -i'"; \
    echo "alias mv='mv -i'"; \
    echo "alias ls='ls --color=auto'"; \
    echo "alias l='ls -lart'"; \
    echo "alias lt='ls -lart|tail'"; \
    echo "alias grep='grep --color=auto'"; \
    echo "alias p='ps -ef|grep -Ev \042grep -E|ps -ef\042|grep --color=auto -i'"; \
    } > /etc/profile.d/common.sh \
    && yum install -y which pcre-devel openssl-devel gcc curl perl make python3 postgresql-libs postgresql-devel cmake \
    && yum clean all 

RUN set -ex \
    && pip3 install conan \
    && rm -Rf ~/.cache/pip/* \
    && conan profile new default --detect \
    && conan profile update settings.compiler.libcxx=libstdc++11 default \
    && echo "conan config done"


WORKDIR ${homedir}
EXPOSE ${expose}
