#!/bin/bash
#add fix to exercise6-fix here

# Add su commnad
PATH=$PATH:/usr/bin;
export PATH

# Allow to run only with more than 2 argument
if [ "$#" -lt 2 ]
then
     echo  "Please insert at least 2 argument"
     exit
else
    #SERVER=ip a | grep 192.168.100.1 | awk '/inet/ {print $2}' | sed 's#/.*##'

    # Set IP of the remote server
    if [ "${HOSTNAME}" == "server1" ]
    then
        REMOTE_SERVER="192.168.100.11"
    else
        REMOTE_SERVER="192.168.100.10"
    fi

	# Files to copy string
    FILES="${@:1:$#-1}"
    
	# Copy all files to remote server
	sudo sshpass -p vagrant su - vagrant -c "sshpass -p vagrant rsync -av $FILES vagrant@$REMOTE_SERVER:${@:$#} --stats | grep 'Total file size:' | tr -dc '0-9'"
fi
