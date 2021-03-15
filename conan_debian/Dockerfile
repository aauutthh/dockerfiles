FROM python:3.7-buster

# 修改系统时区为东八区
# 设置镜象源
ENV TZ="Asia/Shanghai" \
    APT_MIRRORS="https://mirrors.cloud.tencent.com/" \
    APT_DISTTYPES="main contrib non-free" \
    APT_LISTFILE="/etc/apt/sources.list.d/tencent.list" \
    PIP_HOST="pypi.server.com" \
    PIP_URL="http://pypi.server.com/pypi" \
    PIP_INDEX="http://pypi.server.com/simple"

    #PIP_HOST="mirrors.cloud.tencent.com"
    #PIP_URL="https://mirrors.cloud.tencent.com/pypi"
    #PIP_INDEX="https://mirrors.cloud.tencent.com/pypi/simple"

RUN set -ex \
    && echo "# setting deb" > /etc/apt/sources.list \
    && echo "deb ${APT_MIRRORS}debian/ buster ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && echo "deb ${APT_MIRRORS}debian/ buster-updates ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && echo "deb ${APT_MIRRORS}/debian/ buster-backports ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && echo "deb ${APT_MIRRORS}/debian-security buster/updates ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && apt-get update \
    && apt-get install -y git-core \
    && apt-get install -y build-essential autoconf automake gdb manpages-dev cmake libssl-dev vim openssl libffi-dev git \
    && echo "apt get done"

# delete cache /var/cache/apt

#pip install
RUN set -ex \
    && pip config set global.index ${PIP_URL} \
    && pip config set global.index-url ${PIP_INDEX} \
    && pip config set global.trusted-host ${PIP_HOST} \
    && pip install pip --upgrade \
    && pip install conan \
    && rm -Rf ~/.cache/pip/* \
    && echo "pip install done"


WORKDIR /root

