FROM centos:7.6.1810 AS base

ENV OPENRESTY_HOME=/opt/openresty
#修改系统时区为东八区
ENV TZ="Asia/Shanghai" \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8' \
    LD_LIBRARY_PATH=$OPENRESTY_HOME/luajit/lib \
    PATH=$OPENRESTY_HOME/bin:$PATH

COPY ["yum.repos.d", "pki", "/etc/"]

# && pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple \

RUN set -ex \
    && mkdir ~/.pip \
    && { echo "[global]"; \
    echo "index = http://pypi.server.com/pypi"; \
    echo "index-url = http://pypi.server.com/simple"; \
    echo "trusted-host = pypi.server.com"; \
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
    && yum install -y which pcre-devel openssl-devel gcc curl perl make python3 postgresql-libs postgresql-devel \
    && pip3 install six

################

FROM base as builder

COPY openresty-1.19.3.1.tar.gz /data/src/
WORKDIR /data/openresty


RUN set -ex \
    && mkdir -p /data/openresty/workspace/logs \
    && tar -xzvf /data/src/openresty-1.19.3.1.tar.gz \
    && cd openresty-1.19.3.1 \
    && mkdir $OPENRESTY_HOME \
    && ./configure --prefix=$OPENRESTY_HOME \
            --with-luajit \
            --with-pcre-jit \
            --without-http_redis2_module \
            --with-http_iconv_module \
            --with-http_postgres_module \
    && make \
    && make install

################

FROM base

COPY --from=builder /opt /opt

RUN set -ex \
    && mkdir -p /data/openresty/workspace/logs \
    && cd $OPENRESTY_HOME/bin; ln -sf ../nginx/sbin/nginx openresty;

# https://openresty.org/cn/getting-started.html
COPY nginx_example.conf /data/openresty/workspace/conf/nginx.conf
COPY docker-entrypoin.sh /

WORKDIR /data/openresty

EXPOSE 8080
ENTRYPOINT [ "sh", "/docker-entrypoin.sh" ]
