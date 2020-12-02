FROM python:3.7-buster

# 修改系统时区为东八区
# 设置镜象源
ENV TZ="Asia/Shanghai" \
    APT_MIRRORS="https://mirrors.cloud.tencent.com/" \
    APT_DISTTYPES="main contrib non-free" \
    APT_LISTFILE="/etc/apt/sources.list.d/tencent.list" \
    PIP_MIRRORS="https://mirrors.cloud.tencent.com/pypi/simple"

RUN set -ex \
    && echo "# setting deb" > /etc/apt/sources.list \
    && echo "deb ${APT_MIRRORS}debian/ buster ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && echo "deb ${APT_MIRRORS}debian/ buster-updates ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && echo "deb ${APT_MIRRORS}/debian/ buster-backports ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && echo "deb ${APT_MIRRORS}/debian-security buster/updates ${APT_DISTTYPES}" >> ${APT_LISTFILE} \
    && apt-get update \
    && apt-get install -y git-core vim \
    && echo "apt get done"

# delete cache /var/cache/apt

#yum install && python3.5 env
ADD ./requirement.txt /data/release/requirement.txt

#pip install
RUN set -ex \
    && pip config set global.index-url ${PIP_MIRRORS} \
    && pip install -r /data/release/requirement.txt \
    && rm -Rf ~/.cache/pip/* \
    && echo "pip install done"

ADD entrypoint.sh /bin/entrypoint.sh
COPY foo /root/.vim/pack/foo

WORKDIR /data/release/

EXPOSE 8000
ENTRYPOINT ["/bin/sh", "/bin/entrypoint.sh"]
