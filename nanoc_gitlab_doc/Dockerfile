FROM ruby:2.7

ENV TZ="Asia/Shanghai" \
    BUNDLE_GEMFILE=/root/Gemfile \
    BUNDLE_BIN_PATH=/root/vendor 

COPY Gemfile /root/Gemfile

RUN ruby -v \
  && cd /root \
  && bundle config set path 'vendor' \
  && bundle install --jobs 4

RUN set -ex \
  && set -o vi \
  && mkdir -p /data \
  && {\
      echo "# common profile"; \
      echo "alias nanoc='bundle exec nanoc'"; \
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

WORKDIR /root
EXPOSE 3000
