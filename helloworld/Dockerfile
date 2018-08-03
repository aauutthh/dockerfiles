FROM debian:jessie-20180625
ARG passarg=hello
ENV PARG=${passarg}
WORKDIR /root
COPY entrypoint.sh /root
ENTRYPOINT ["entrypoint.sh"]
CMD ["sh","-c","echo $PARG"]
