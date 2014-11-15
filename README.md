### Docker Dev Env ###

This is just me screwing around.  The idea is that I want to be able to have a well-configured 
development environment anywhere I go.  I love i3 Window Manager, and hate to be without it. 

So I started with Ubuntu - because it's ubiquitous, added i3 and some vnc love.  Pre-packaged my
i3 config files, and started vncserver.

The /home/bketelsen directory is created as a volume, but you shouldn't mount a local volume directly there.
Instead mount something underneat it, like this:

```
docker run -d -P -v /home/bketelsen/src:/home/bketelsen/src bketelsen/dockerdevenv
```

Now your local ~/src directory will be available inside the docker container.

I may try running this on various hosts until I find something I'm happy with:

	* CoreOS
	* Boot2Docker on my Mac
	* My Arch linux server

A fully configured but portable development environment seems like a great idea.  Let's
see if it works.

The VNC password is `docker`.  I borrowed the idea for the vnc config from some other docker repo, and 
it was already generated.  So I lazily kept it.

### Running ###
First, clone this repo and change all instances of `bketelsen` to your username in all the various
files.

Second, you might want to edit the config file that gets put in ~/.i3/config  It has my preferences in 
it and you might not like them.

Third, run the container:
```
docker run -d -P -v /home/you/somedir:/home/you/somedir you/dockerdevenv
```

```
docker ps
```
find port for dockerdevenv 5901, and attach with VNC viewer.

Profit
