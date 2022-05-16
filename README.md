# nutek-core
My preciousssss.... 😼

This is the base, for all my cyber security tasks. If it can be done in
command line - I want in. Tested throughout the course of [TryHackMe](https://tryhackme.com/) _currently on the level of complete newbie - lamer_.

Obvious mischiefs? GUI programs. Burp, Beef, Firefox, Zenmap... And many others... But hey, you can `echo "Hej Nutek!"` - GUI say no
to Docker, I say no to GUI. Anyway, have fun.

Where we will be going from here? I have plans to automate the process of gathering information and creating reports. To make it easy getting us to payday! There are websites that offer bug bounties for documenting security flaws in software, hardware, websites and servers.

I share my list:
  - [Bugcrowd](https://www.bugcrowd.com)
  - [Safehats](https://safehats.com)
  - [Cobalt](https://www.cobalt.io)
  - [SynAck](https://www.synack.com)
  - [Google Bug Hunters](https://bughunters.google.com/)
  - *[HackerOne](https://www.hackerone.com/hackers)*

## How to use?

1. Make a directory `mkdir $HOME/.nutek` - that's where I plan to 
store the data. The first thing that will land there is a bash
history in SQLite3 database `.nutek/recent-bash_logs.db` - so you
can easily track your progress through all CTF and Bug Bounty,
Penetration Testing, Ethical Hacking and selling drugs online (SIC!)

2. Pull the docker image from [hub.docker.com](https://hub.docker.com/repository/docker/neosb/nutek-core) with easy command (if you already have Docker Desktop or similar) `docker pull neosb/nutek-core:latest`

3. Now the tricky part. You wish to preserve the history, right? If not skip to the next step. To get all the goodies that will be stored in machine, you should make your `.nutek` folder available to the container, so use `-v $HOME/.nutek:/root/.nutek` switch, the full command for my kind of storage look like this
    - `docker run -it --rm -v $HOME/.nutek:/root/.nutek neosb/nutek-core:latest`
    - if you want all the things that are in `/root` that is the `$HOME` directory for this container, give your terminal of choice a command: `docker run -it --rm -v $HOME/.nutek:/root neosb/nutek-core:latest`

Both of this commands will delete the container upon `exit` and place you in default shell upon "enter the matrix"

_when you exit_ __everything__ is **deleted** beside thing you put in `.nutek` directory, look there from you local OS to see if all you needed to get from your journey is safely saved and secured

#TODO - automated scripts that gather logs from included programs that copy reports to .nutek folder

- if you wish to preserve your container instance, thus **not** deleting any information stored in it. because why would anybody else look there? drop the `--rm` switch shortening the run command to `docker run -it neosb/nutek:latest`

4. If you know what you're doing... What are you doing here? Just run the container however you like, and enjoy.

If you would like to look inside the nutek-core engine, follow [this rabbit](https://github.com/phoenix-journey/nutek-core)

5. The first hing you'll see while in `nutek-core` is a greeting and a 
`recent` warning

```
recent: cannot parse command output, please check your bash trigger looks like this:
```

you can safely ignore it, as everything is in place, what you can check
with:

```
cat ~/.bashrc
```

If after this command you can check your bash history using
`recent`, I didn't make any mistake. If not, I kindly please
so you [fill an issue](https://github.com/phoenix-journey/nutek-core/issues) on my github page or help me get rid off this warning - [recent2](https://github.com/dotslash/recent2)

6. Sometimes you might want to expose some ports in your container to the network, and you do it by supplying `-p 8080:80` switch. Then from another OS, or even from the same host, like the OS running Docker Desktop, execute command `nmap localhost -p 8080 -oX make_notes_on_the_go.xml` to check if everything is setup correctly and then run this command on your `nutek-core` container `ncat -lvnp 80` and in your host OS `ncat 0.0.0.0 8080`, write something, and get back to `nutek-core` to see if it is displayed. If so... You're ready to _hacz_. If you don't have `ncat` on your host get it [here](https://nmap.org/ncat/). _What we have done_? We exposed port 80 in your container to mapped port 8080 in your host, then connected simple TCP session from host to listening contianer and send a message.

## Where to go from here?

The best place to start? It's [here](https://github.com/phoenix-journey/vulhub) - take a look, spin up some containers, and _hacz_.

#### !WARNING!!

All you do leave a **track**, so you have to know that the first name
for this Linux flavour was BackTrack. There is also another [ParrotOS](https://www.parrotsec.org) and the one you're currently looking at is named [Kali Linux](https://www.kali.org), just so you know.