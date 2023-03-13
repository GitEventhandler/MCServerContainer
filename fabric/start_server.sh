#! /bin/bash
PLACEHOLDER="/root/CONTAINER_ALREADY_STARTED_PLACEHOLDER"
FABRIC_URL="https://meta.fabricmc.net/v2/versions/loader/$MINECRAFT_VERSION/$FABRIC_VERSION/$FABRIC_INSTALLER_VERSION/server/jar"
# only when /server is empty and the container never started, excute forge download procedure
if [ ! -e $PLACEHOLDER ]; then
    touch $PLACEHOLDER
    # only when the /server path is empty, download forge
    if [ "`ls -A $SERVER_PATH`" = "" ]; then
        echo "-- download fabric-$FABRIC_VERSION --"
        curl --create-dirs -sLo ${SERVER_PATH}/fabric-launcher.jar ${FABRIC_URL}
        mkdir ${SERVER_PATH}/mods
        echo "eula=$EULA" > ${SERVER_PATH}/eula.txt
        echo "-- install minecraft server --"
        java -jar ${SERVER_PATH}/fabric-launcher.jar server -mcversion ${MINECRAFT_VERSION} -dir ${SERVER_PATH}
        echo "java -Xmx2G -Xms2G -jar fabric-launcher.jar nogui" > ${SERVER_PATH}/run.sh
        chmod 744 ${SERVER_PATH}/run.sh
    fi
    echo "-- install complete --"
else
    echo "-- start minecraft server --"
    cd ${SERVER_PATH}
    bash ./run.sh
fi
