#!/bin/sh
#Author: xingxiudong.com
#Date: 2014-12-24

# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`

jarfile=$PRGDIR/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar
logfile=$PRGDIR/zkui.log

cd $PRGDIR
pid=$(ps -ef | grep $jarfile | grep java | awk '{print $2}')

if [ "$pid" != "" ];then
    echo "ERROR: $jarfile is running! pid=$pid. You must stop it first!"
else
    #nohup java -jar $jarfile >/dev/null 2>&1 &
    nohup java -jar $jarfile >$logfile 2>&1 &
    
    pid=$(ps -ef | grep $jarfile | grep java | awk '{print $2}')
    echo "INFO: $jarfile is running! pid=$pid"
fi