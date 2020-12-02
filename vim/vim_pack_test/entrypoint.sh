if [ "-${SETUID}-" = "--" ];then
   SETUID=1001 
fi

diruid=`stat -c "%u" .`

id $SETUID >/dev/null 2>&1 || useradd -r -u $SETUID ops

UNAME=`id -nu $SETUID`

if [ $diruid -eq 0 -a $SETUID -ne 0 ];then
  chown -R ops .
fi

exec runuser -u ${UNAME} -- "$@"
