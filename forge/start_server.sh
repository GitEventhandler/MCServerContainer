#! /bin/bash
PLACEHOLDER="/root/CONTAINER_ALREADY_STARTED_PLACEHOLDER"
FORGE_URL="https://maven.minecraftforge.net/net/minecraftforge/forge/$MINECRAFT_VERSION-$FORGE_VERSION/forge-$MINECRAFT_VERSION-$FORGE_VERSION-installer.jar"
# only when /server is empty and the container never started, excute forge download procedure
if [ ! -e $PLACEHOLDER ]; then
    touch $PLACEHOLDER
    # only when the /server path is empty, download forge
    if [ "`ls -A $SERVER_PATH`" = "" ]; then
        echo "-- download forge-$FORGE_VERSION --"
        curl --create-dirs -sLo ${SERVER_PATH}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar ${FORGE_URL}
        mkdir ${SERVER_PATH}/mods
        echo "eula=$EULA" > ${SERVER_PATH}/eula.txt
        echo "-- install minecraft server --"
        java -jar ${SERVER_PATH}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar --installServer /server
        echo "-- delete forge installer --"
        rm -f ${SERVER_PATH}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar ${SERVER_PATH}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar.log
        chmod 744 ${SERVER_PATH}/run.sh
    fi
    echo "-- install complete --"
else
    echo "-- start minecraft server --"
    cd ${SERVER_PATH}
    bash ./run.sh
fi
