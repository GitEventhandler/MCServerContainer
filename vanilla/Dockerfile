FROM openjdk:17

COPY start_server.sh /root/start_server.sh

ENV SERVER_PORT 25565
ENV SERVER_PATH /server
ENV SERVER_DOWNLOAD_URL "https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar"
ENV EULA false

RUN chmod 744 /root/start_server.sh

EXPOSE ${SERVER_PORT}

ENTRYPOINT ["/root/start_server.sh"]