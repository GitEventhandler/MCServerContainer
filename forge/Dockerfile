FROM openjdk:17

COPY start_server.sh /root/start_server.sh

ENV SERVER_PORT 25565
ENV SERVER_PATH /server
ENV MINECRAFT_VERSION 1.18.2
ENV FORGE_VERSION 40.2.0
ENV EULA false

RUN chmod 744 /root/start_server.sh

EXPOSE ${SERVER_PORT}

ENTRYPOINT ["/root/start_server.sh"]