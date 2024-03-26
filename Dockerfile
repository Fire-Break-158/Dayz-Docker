FROM steamcmd/steamcmd:debian
# steamcmd doesnt work properly on ubuntu 20 due to misssing 32 bit deps

ENV DEBIAN_FRONTEND=noninteractive

# install deps
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install lib32gcc-s1 -y

# game
EXPOSE 2302/udp
EXPOSE 2303/udp
EXPOSE 2304/udp
EXPOSE 2305/udp
# steam
EXPOSE 8766/udp
EXPOSE 27016/udp

# reset cmd & define entrypoint
CMD [ "start" ]
COPY entrypoint.sh /servers/dayz-server/entrypoint.sh
ENTRYPOINT [ "/servers/dayz-server/entrypoint.sh" ]
