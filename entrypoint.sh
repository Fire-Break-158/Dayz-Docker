#!/bin/bash


function startGame() {
    cd /root/servers/dayz-server
    ./DayZServer \
	-config=serverDZ.cfg \
	-port=2302 \
	-BEpath=battleye \
	-profiles=profiles \
	-dologs \
	-adminlog \
	-netlog \
	-freezecheck
}


function updateGame() {
    mkdir -p ~/servers/steamcmd && cd ~/servers/steamcmd
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
    ~/servers/steamcmd/steamcmd.sh \
	+force_install_dir ~/servers/dayz-server/ \
	+login steamusername steampassword \
	+app_update 223350 \
	+quit
}


case "$1" in
    start)
        updateGame
        startGame
    ;;
    update)
        updateGame
    ;;
    *)
        exec "$@"
    ;;
esac
