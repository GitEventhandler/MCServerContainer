FROM openjdk:17

COPY start_server.sh /root/start_server.sh

ENV SERVER_PORT 25565
ENV SERVER_PATH /server
ENV MINECRAFT_VERSION 1.18.2
ENV FABRIC_VERSION 0.14.17
ENV FABRIC_INSTALLER_VERSION 0.11.2
ENV EULA false

RUN chmod 744 /root/start_server.sh

EXPOSE ${SERVER_PORT}

ENTRYPOINT ["/root/start_server.sh"]