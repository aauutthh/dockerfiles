FROM debian:jessie-20180625
ARG passarg=hello
ENV PARG=${passarg}
COPY entrypoint.sh /
ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["sh","-c","echo $PARG"]
