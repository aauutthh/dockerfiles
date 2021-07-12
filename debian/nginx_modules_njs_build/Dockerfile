FROM debian:buster

# for 公网
# ARG APT_MIRRORS="http://mirrors.cloud.tencent.com"
# for 内网
ARG APT_MIRRORS="http://mirrors.tencentyun.com"
ARG APT_DISTTYPES="main contrib non-free"
ARG APT_SOURCE_LIST_D="/etc/apt/sources.list.d"
ARG APT_SOURCE_LIST=${APT_SOURCE_LIST_D}"/tencent.list"
ARG PYPI_HOST="pypi.server.com"
ARG PYPI_URL="http://${PYPI_HOST}/pypi"
ARG PYPI_INDEX="http://${PYPI_HOST}/simple"
ARG TZ="Asia/Shanghai"

# 修改系统时区为东八区
# 设置镜象源
ENV TZ=${TZ}
ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \
    && mv /etc/apt/sources.list /etc/apt/sources.list.back \
    && echo "\
deb ${APT_MIRRORS}/debian/ buster ${APT_DISTTYPES}\n\
deb-src ${APT_MIRRORS}/debian/ buster ${APT_DISTTYPES}\n\
deb ${APT_MIRRORS}/debian/ buster-updates ${APT_DISTTYPES}\n\
deb ${APT_MIRRORS}/debian/ buster-backports ${APT_DISTTYPES}\n\
deb ${APT_MIRRORS}/debian-security/ buster/updates ${APT_DISTTYPES}\n\
" > ${APT_SOURCE_LIST} \
    && echo "\
[global]\n\
index = ${PYPI_INDEX}\n\
index-url = ${PYPI_URL}\n\
trusted-host = ${PYPI_HOST}\n\
" > /etc/pip.conf

WORKDIR /data

