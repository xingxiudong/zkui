#!/bin/sh

ifrun=$(ps -ef | grep 'zkui-2.0' | grep java)
if [ "$ifrun" != "" ];then
    echo "Running...You must stop it first!"
else
	#nohup java -Djava.ext.dirs=lib -Dfile.encoding=UTF-8 -jar zkui-2.0-SNAPSHOT.jar >/dev/null 2>&1 &
	nohup java -jar zkui-2.0-SNAPSHOT.jar >/dev/null 2>&1 &
	echo "Started!"
fi