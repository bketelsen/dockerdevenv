### Docker Dev Env ###
*** Not quite yet working, but really close ***

The idea is that I want to be able to have a well-configured 
development environment anywhere I go.  I love i3 Window Manager, and hate to be without it. 

More importantly, this process makes your development environment 100% repeatable and portable; which 
is the same ethos that Docker attempts to bring to your applications.  No more pain when you get a new 
developer machine.  No more pain when working on a borrowed computer.  No more pain when working on a remote
server.  Just docker pull bketelsen/devenv, and run it.  You'll have exactly the same development
experience on EVERY computer you use, whether it's your Mac or a debugging session on a QA/Staging 
server.

#### Inspiration ####
I've been running a headless Arch linux box for several months now as my main development environment.  I
connect via VNC using Mac OS X's screen sharing, or VNC viewer on my iPad.  It's fast, efficient, and awesome.

But I wanted to be able to develop on my Mac locally when I travel and have no Internet connection.  Or 
when Internet is unreliably slow.  Using this Docker development container works equally well on any machine with
Docker or Boot2Docker.  

#### USAGE ####
Usage instructions assume that you've cloned this repo and changed my username {bketelsen} to your own.
*** Running the docker image bketelsen/devenv will give you my dotfiles, and you'll be running as user `bketelsen`.  Instead FORK this repo and make changes. ***
Also assumed: You've run the buildContainers.sh script and pushed your images to hub.docker.com

##### Mac #####
Install boot2docker
```
boot2docker init
export DOCKER_HOST={get boot2docker IP and add it here}
docker run -d -P -v /Users/YOU/yourSourceDir:/home/YOU/yourSourceDir yourdockerusername/devenv
```

##### Linux #####
```
docker run -d -P -v /Users/YOU/yourSourceDir:/home/YOU/yourSourceDir yourdockerusername/devenv
```

##### Connecting To the UI #####
`docker port yourusername/devenv` will give you two ports.  The port that maps to 5901 is sized for 
a Thunderbolt display at full screen.  The port that maps to 5902 is sized for a MBP 15" retina display
at full screen.  

Use any vnc client, and connect to the DOCKER_HOST:MAPPED_PORT  e.g.  mylinuxserver:49153
Password is `docker`.



### Layers Like an Ogre ###
These docker images represent layers that you can build from to create a dev environment that
suits you.

#### Layer 0 ####
ubuntu

This may change, because I really like Arch.  But it is easier to setup an Ubuntu machine than an Arch machine (for me)
  so I'm starting here.

#### Layer 1 ####
bketelsen/osbase 

This layer adds openssh-server.  Not using it yet.  May never need it.  But it's there.

#### Layer 2 ####
bketelsen/commandbase

This layer adds development tools and command tools.  Right now they're development tools for Go, but they could be for any language.
In fact, one could create many different `commandbase` containers and have a unique dev environment for each different
programming language.  Not necessary here, but an interesting idea.

```
RUN apt-get update && apt-get install -y ca-certificates curl unzip tar ...
RUN curl -Ls https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz | tar xvzf - -C /usr/local/go --strip-components=1
```

#### Layer 3 ####
bketelsen/uibase

This layer adds the i3 window manager, a VNC server and the tools needed to be comfortable in i3.

```
RUN apt-get update && apt-get install -y i3 terminator feh dmenu dunst connman-ui rox-filer hexchat tightvncserver vim-gtk 
RUN easy_install supervisor
```

TODO: Good web browser like Chrome, Chromium, Firefox

#### Layer 4 ####
bketelsen/devenv

This is the final layer, the container that you'll want to run. It adds your personalized configurations.

TODO: 
* direnv


To run you should attach a local volume.  Although the entire home directory is exported as a volume, you shouldn't attach
an entire local home dir or you'll overwrite your own config files.  Instead, selectively attach folders like this:

`docker run -d -P -v /Users/bketelsen/src:/home/bketelsen/src bketelsen/devenv`

Get the VNC port:
`docker port bketelsen/devenv 5901` for Thunderbolt display full screen.
or
`docker port bketelsen/devenv 5902` for MBP 15" display full screen

Then connect with vnc via DOCKERHOST_IP:VNCPORT  The vnc password is `docker` and is contained in /useradd/vncpasswd.  
Generate your own if you wish and replace this file.

TODO: Consider ssh tunneling instead of or in addition to VNC port expose.

Then your local `src` directory will be available inside the container.

For Go development, don't put your entire GOPATH inside a volume.  e.g. don't put the pkg and bin folders inside
the container.  If you're on windows or a mac, you'll make yourself sad littering your GOPATH/pkg and bin dirs with
linux libraries and binaries.




### Make it yours ###
I added all these unnecessary layers so that you can inherit from any level and customize as you see fit.
It also significantly reduces build times when you make a change.  Only layers with changes will get rebuilt and 
pushed.

All the Dockerfiles in the repo use a $user variable.  You should be able to clone this repository and make it work
by changing the single ENV user statements in them.  Same goes with the shell scripts.  The stowDotfiles.sh script expects
that you have a github.com/YOU/dotfiles repository.  It also makes grand assumptions about what things you'll want
to stow.  Change most of this.

I'm very open to community suggestions and ideas about how to improve this.  Especially with the user layering.  


### TODO ###
* DONE - Give buildContainers.sh a username and have it replace a stubbed username with the one given using sed.
* DONE - Or -- Pass in a username as an ENV var and use ONBUILD to rig all this up?  Might not be possible, fun to try.





