# nutek-core
My preciousssss.... 😼

This is the base, for all my cyber security tasks. If it can be done in
command line - I want in. Tested throughout the course of [TryHackMe](https://tryhackme.com/).

Obvious mischiefs? GUI programs. Burp, Beef, Firefox, Zenmap... And many others... But hey, you can `echo "Hej Nutek!"` - GUI say no
to Docker, I say no to GUI. Anyway, have fun.

## How to use?

1. Make a directory `mkdir $HOME/.nutek` - that's where I plan to 
store the data. The first thing that will land there is a bash
history in SQLite3 database `.nutek/bash_logs/recent.db` - so you
can easily track your progress through all CTF and Bug Bounty,
Penetration Testing, Ethical Hacking and selling drugs online (SIC!)

2. Pull the docker image from [hub.docker.com](https://hub.docker.com/repository/docker/neosb/nutek-core) with easy command (if you already have Docker Desktop or similar) `docker pull neosb/nutek-core:latest`

3. Now the tricky part. You wish to preserve the history, right? If not skip to the next step. To get all the goodies that will be stored in machine, you should make your `.nutek` folder available to the container, so use `-v $HOME/.nutek:/root/.nutek` switch, the full command for my kind of storage look like this
    - `docker run -it --rm -v $HOME/.nutek:/root/.nutek neosb/nutek-core:latest`
    - if you want all the things that are in `/root` that is the `$HOME` directory for this container, give your terminal of choice a command: `docker run -it --rm -v $HOME/.nutek:/root neosb/nutek-core:latest`

Both of this commands will delete the container upon `exit` and place you in default shell upon "enter the matrix"

4. If you know what you're doing... What are you doing here? Just run the container however you like, and enjoy.

If you would like to look inside the nutek-core engine, follow [this rabbit](https://github.com/phoenix-journey/nutek-core)