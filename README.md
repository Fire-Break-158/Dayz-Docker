# Dayz-Docker
Docker image for DayZ stable with no mods

Currently the server download has to be done via your account as BiStudios has not released the server files to the steam anonymous account.
To get started open entrypoint.sh and replace "steamusername" with your steam username and replace "steampassword" with your steam password. 
Keep in mind, this is a bit sketchy, even to me but it will require you to put in the 2 factor auth code every time you start or restart your container.
A potential solution is that you can disable 2 factor authentication so that it boots smoothly or you can make a 2nd account and purchase DayZ just to run the server on an account that isn't your main.
I certainly don't recommend this and have reached out to BiStudios to hopefully resolve this and get the DayZ server put on the anonymous account that valve has made public so we can set up the server without a real login.
Regardless, both are options if you really want a docker container for the game.


Keep in mind, I am talking about doing this from a Linux machine, Windows docker may be different
To get the server started once you have your info in entrypoint.sh and ensure you have docker setup you can run command 'docker build -t msessions/dayz-docker .' in the same directory as the Dockerfile and entrypoint.sh. 
Some installations of docker require you to run this command with 'sudo'.

From here, you have the docker image built on your machine and you can run the image with any desired options. 
I typically use 'docker run --name dayz --net=host --restart unless-stopped -it -p 2302:2302 -p 2303:2303 -p 2304:2304 -p 2305:2305 -p 8766:8766 -p 27016:27016 -v /root/dayz:/root/servers msessions/dayz'

I'll break it down below

start your command									docker run
name your container									--name dayz 
connect it to your existing network							--net=host
if your container crashes it restarts							--restart unless-stopped
connecting internal ports to the ports of your pc					-p 2302:2302		dayz
											-p 2303:2303		*
											-p 2304:2304		*
											-p 2305:2305		*
											-p 8766:8766		steam
											-p 27016:27016		*
mapping the server to your pc so you dont have to redownload the game every reboot	-v /home/msessions/dayz:/root/servers
name of the image you want to use							dayz


If you run into any bugs or issues or even have recommendations feel free to open an issue, I am relatively new to docker but love what it offers and am working to build on my knowledge.
