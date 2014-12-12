#!/bin/sh

process="zkui-2.0";

ifrun=$(ps -ef | grep $process | grep java)
if [ "$ifrun" != "" ];then
    kill -9 `ps -ef | grep $process | grep java | awk '{print $2}'`
    echo "Stoped!"
else
    echo "Not found $process running."
fi
