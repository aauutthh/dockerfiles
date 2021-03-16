FROM debian:buster

ENV TZ="Asia/Shanghai" \
    APT_MIRRORS="http://mirrors.cloud.tencent.com/" \
    APT_DISTTYPES="main contrib non-free" \
    APT_LISTFILE="/etc/apt/sources.list.d/tencent.list"

RUN set -ex \
  && rm -f /etc/apt/sources.list \
  && {\
      echo 'Acquire::https::mirrors.cloud.tencent.com::Verify-Host "false";'; \
      echo 'Acquire::https::mirrors.cloud.tencent.com::Verify-Peer "false";'; \
    } > /etc/apt/apt.conf.d/09trust-tencent \
  && {\
      echo "# setting deb"; \
      echo "deb [trusted=yes] ${APT_MIRRORS}debian/ buster ${APT_DISTTYPES}"; \
      echo "deb [trusted=yes] ${APT_MIRRORS}debian/ buster-updates ${APT_DISTTYPES}"; \
      echo "deb [trusted=yes] ${APT_MIRRORS}/debian/ buster-backports ${APT_DISTTYPES}"; \
      echo "deb [trusted=yes] ${APT_MIRRORS}/debian-security buster/updates ${APT_DISTTYPES}"; \
     } > ${APT_LISTFILE} \
  && mkdir -p ~/.pip \
  && {\
      echo "[global]"; \
      echo "index = http://pypi.server.com/pypi"; \
      echo "index-url = http://pypi.server.com/simple"; \
      echo "trusted-host = pypi.server.com"; \
     } > ~/.pip/pip.conf \
  && apt-get update \
  && apt-get install -y git vim python3-pip python3 gnupg git-crypt gpg imagemagick qrencode\
  && pip3 install gnupg  ipython 
	
RUN set -ex \
  && mkdir -p /data \
  && {\
      echo "# common profile"; \
      echo "set -o vi"; \
      echo "alias cp='cp -i'"; \
      echo "alias rm='rm -i'"; \
      echo "alias mv='mv -i'"; \
      echo "alias ls='ls --color=auto'"; \
      echo "alias l='ls -lart'"; \
      echo "alias lt='ls -lart|tail'"; \
      echo "alias grep='grep --color=auto'"; \
      echo "alias p='ps -ef|grep -Ev \042grep -E|ps -ef\042|grep --color=auto -i'"; \
    } > /etc/profile.d/common.sh

WORKDIR /data/
