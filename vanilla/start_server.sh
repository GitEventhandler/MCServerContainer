#! /bin/bash
PLACEHOLDER="/root/CONTAINER_ALREADY_STARTED_PLACEHOLDER"
# only when /server is empty and the container never started, excute forge download procedure
if [ ! -e $PLACEHOLDER ]; then
    touch $PLACEHOLDER
    # only when the /server path is empty, download forge
    if [ "`ls -A $SERVER_PATH`" = "" ]; then
        echo "-- download vanilla server --"
        curl --create-dirs -sLo ${SERVER_PATH}/server.jar ${SERVER_DOWNLOAD_URL}
        echo "eula=$EULA" > ${SERVER_PATH}/eula.txt
        echo "java -Xmx1024M -Xms1024M -jar server.jar nogui" > ${SERVER_PATH}/run.sh
        chmod 744 ${SERVER_PATH}/run.sh
    fi
    echo "-- install complete --"
else
    echo "-- start minecraft server --"
    cd ${SERVER_PATH}
    bash ./run.sh
fi
