#!/bin/sh
#Author: xingxiudong.com
#Date: 2014-12-24

process=zkui-2.0-SNAPSHOT-jar-with-dependencies.jar

ifrun=$(ps -ef | grep $process | grep java)
if [ "$ifrun" != "" ];then
    kill -9 `ps -ef | grep $process | grep java | awk '{print $2}'`
    echo "INFO: $process is stoped!"
else
    echo "WARN: Not found $process running."
fi
