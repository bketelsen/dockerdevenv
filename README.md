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
