# nutek-core

```
::::    ::: :::    ::: ::::::::::: :::::::::: :::    ::: 
:+:+:   :+: :+:    :+:     :+:     :+:        :+:   :+:  
:+:+:+  +:+ +:+    +:+     +:+     +:+        +:+  +:+   
+#+ +:+ +#+ +#+    +:+     +#+     +#++:++#   +#++:++    
+#+  +#+#+# +#+    +#+     +#+     +#+        +#+  +#+   
#+#   #+#+# #+#    #+#     #+#     #+#        #+#   #+#  
###    ####  ########      ###     ########## ###    ### 😼 
Neosb https://neosb.marketplaceinspace.com
```

This is the base, for all my cyber security tasks. If it can be done in
command line - I want in.

Obvious mischiefs? GUI programs. Burp, Beef, Firefox, Zenmap... And many others... But hey, you can `echo "Hej Nutek!"` - GUI say no
to Docker, I say no to GUI. Anyway, have fun.

Where we will be going from here? I have plans to automate the process of gathering information and creating reports. To make it easy getting us to payday! There are websites that offer bug bounties for documenting security flaws in software, hardware, websites and servers.

## nutek-core:slim start-nutek helper

I have made a simple Python program that spins up nutek-core:slim container for you. You can look into it in `programs` folder, run it
with your Python `python3 programs/start-nutek.py` or use
docker 

[WIKI - Bug Bounty Program](https://en.wikipedia.org/wiki/Bug_bounty_program)

I share my list:
  - [Bugcrowd](https://www.bugcrowd.com)
  - [Safehats](https://safehats.com)
  - [Cobalt](https://www.cobalt.io)
  - [SynAck](https://www.synack.com)
  - [Google Bug Hunters](https://bughunters.google.com/)
  - *[HackerOne](https://www.hackerone.com/hackers)*

## How to use?

[skip to manual](#manual)

First of all it's **WORK IN PROGRESS** - definietly not set in stone.

- attach `.nutek` folder for **future** storage and `recent2` command line history or read further for container specific configuration.

- I will maintain two versions of this image, __large__, currently called latest or with just a version and _slim_, *slim_latest* or *slim_version*,  that should be a good to have IT security frameworks. Look into [tags](https://hub.docker.com/r/neosb/nutek-core/tags) to inspect more of the possible features.

  - The common ground for all of the containers is the **base** image, which provides `recent2` for logging bash commands and minimal `Kali Linux` image from _rolling_ branch with `python3`.

## Available nutek-core container image tags

### :base

From where the _Sauron's eye_ see.

You __should__ but are not obligated to have a `.nutek` directory in 
your `$HOME` folder, where all the goodies are stored.

What will land in `.nutek`?
  - logs
    1. `sqlite3` database of `recent2` bash commands
  - reports
  - found vulnerabilities
  - scan results
  - _if it fits, then it sits_
  - security certificates
  - API keys
  - `Python` scripts, and `Rust` binaries

Why? Even if you're a convicted criminal, at least you know why you're
in your current position.

How? Simple. use `docker` command with 

```shell
-v $HOME/.nutek:/root/.nutek
```

switch. It's that simplet to have a storage in your container. You can
safely exchange files between your current containers using this
folder. If you have your system encrypted, then it's the unencrypted
session of your current login shell, X Window system, or Windows
OS state, so if you get to be lost on a journey and get cracked from
outside, you have to terminate your container to turn off the
connection. You could for example use `--rm` switch to instantly on
exiting the container, remove the container from cache, but it
already should be disconnected as far as _I_ know.

To view your command history open-up your `sqlite3` program and run inside it:

```
select * from commands;
```

And there you have it. - This will even log your parallel nutek-core sessions, so the output might be scattered in between many paths you took while playing the **red**/**blue** team _game_.

Take a look around sqlite3 and get help with `.help`, and exit with command `.quit`.

Execute `docker run -h friendly-host-name neosb/nutek-core:base` for your friendly hostname.

### :slim

Successively growing tool for IT Security enthusiasts, professionals looking for open source toolchain and webmasters, system administrators and every other curious computer owner. This container does not need root privilages, so if you can run a container with shell access - `docker run --rm ubuntu:latest echo "Hi Nutek"`, this might be for you. I'm trying to encapsulate most important tools needed, and the best tool available that are open source and/or free of charge.

At the moment this tag consist of:

1. nmap - port scanner
2. curl - see url
3. wget - GNU downloader
4. payloadsallthethings - maybe this will do
5. python3 - programming language
6. mitmproxy - transparent proxy
7. hurl - encoder/decoder
8. w3m - terminal web browser
9. neovim - Vim reimagined, text editor
10. ncat - tcp connection tool

#### mitmproxy

This container provides [mitmproxy](https://mitmproxy.org/), the transparent proxy in the like of `Burp Suite` but open source .

You can intercept, change, manipulate, script it via Python and sniff all the typical web browser stuff. Modify queries on the fly, intercept response and change it to your liking or upload a text file instead of your profile picture... Will it work on `Facebook`?

#### mitmproxy configuration

According to [manual](https://docs.mitmproxy.org/stable/concepts-certificates/)...

Or my way:

 1. Open `mitmproxy` from container with port `8080` exposed and setup your browser proxy...

 2. Configure web browser proxy (`w3m` and `Firefox`) or system-wide proxy for http and https connections to `http://0.0.0.0:8080`

 3. Check if http proxy is working by heading to [http://mitm.it/](http://mitm.it/) website get this certificate and then install the certificate with the way that's described on the page. Certificate will be valid until you destroy your container, either with `--rm` or manually. Then you will need to 
 repeat the steps. Maybe save your container with a `--name mitmproxy` and restert it with `docker start -i mitmproxy` what will preserve your initial `docker run` configuration.

#### mitmweb

Not yet finished "GUI" version of mitmproxy in web browser. Run with caution. Not all features coverd.
You have to expose port `8081` to public to be able to connect to the frontend.

#### mitmweb configuration

Steps are similar to mitmproxy [configuration](#mitmproxy-configuration).

#### mitmdump

tcpdump for web

### :large

This container is mainly prepared for my testing purposes. It is 13 GB large, and that's the reaseon why it's disregarded to use, but if you please, have a test run and give me an input through GitHub issues if you think that something is missing or is in plenty, that is too much. Primarily thought as a recon stage, but grown into unmaintainable size for one person, thus it's have been succesively striped down into smaller pieces.

Complete list of main tools (without dependencies):

1. [nmap](https://nmap.org/) 
2. [curl](https://curl.se/)
3. [wget](https://www.gnu.org/software/wget/)
3. [rust](https://www.rust-lang.org/)
4. [build-essential](https://packages.debian.org/sid/build-essential)
5. [xsltproc](https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home)
6. [rustscan](https://rustscan.github.io/RustScan/)
7. [nvd_cve](https://crates.io/crates/nvd_cve)
8. [feroxbuster](https://epi052.github.io/feroxbuster-docs/)
9. [git](https://git-scm.com/)
10. [fuzz.txt](https://github.com/Bo0oM/fuzz.txt)
11. [python3](https://www.python.org/)
12. [raccoon](https://github.com/evyatarmeged/Raccoon)
14. [go](https://go.dev/)
15. [smap](https://github.com/s0md3v/smap)
16. [vulscan](https://www.computec.ch/projekte/vulscan/)
17. [ping](https://packages.debian.org/sid/iputils-ping)
18. [john](https://www.openwall.com/john/)
19. [hydra](https://github.com/vanhauser-thc/thc-hydra)
20. [hashid](https://github.com/psypanda/hashID)
21. [nuclei](https://nuclei.projectdiscovery.io/)
22. [commix](https://commixproject.com/)
23. [metasploit-framework](https://www.metasploit.com/)
24. [sqlmap](https://sqlmap.org/)
25. [neovim](http://neovim.io/)
26. [finalrecon](https://github.com/thewhiteh4t/FinalRecon)
27. [gobuster](https://github.com/OJ/gobuster)
28. [ncrack](https://nmap.org/ncrack/)
29. [garud](https://github.com/R0X4R/Garud)
30. [payloadsallthethings](https://github.com/swisskyrepo/PayloadsAllTheThings)
31. [seclist](https://owasp.org/www-project-internet-of-things/)
32. [rapidscan](https://github.com/skavngr/rapidscan)
33. [payloads](https://github.com/sh377c0d3/Payloads)
34. [lsd](https://github.com/Peltoche/lsd)
35. [ncat](https://nmap.org/ncat/)
36. [mitmproxy](https://mitmproxy.org/)
37. [hurl](https://github.com/fnord0/hURL)
38. [w3m](http://w3m.sourceforge.net/)
39. []()

## Manual

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

- if you wish to preserve your container instance, thus **not** deleting any information stored in it. because why would anybody else look there? drop the `--rm` switch shortening the run command to `docker run -it neosb/nutek-core:latest`

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

The best place to start? It's [here](https://github.com/phoenix-journey/vulhub) - take a look, spin up some containers, and _hacz_. But we're not there yet are we? If so, please skip this part up
until the [warning](#warning) and maybe think how to cook yourself
an own Linux distribution

You can also try the new package in here, [mitmproxy](https://mitmproxy.org). In short, running mitmproxy from one terminal window run with `docker run -it --rm --name nutek-core neosb/nutek-core:latest mitmproxy` command, and then connecting to the same docker container
from another terminal window/tab with `docker exec -it nutek-core bash`. From now on you might use your first mitmproxy tab to look into http requests and responses you get, post, put, delete and so on.

If you followed my through previous paragraph, try this command:

```shell
curl --proxy http://127.0.0.1:8080 "http://wttr.in/Rome?0"
```

Change the terminal window to your mitmproxy program, and there you can
see your http request intercepted by (_man_) in the middle attack.
Try looking into the mitmproxy [manual](https://docs.mitmproxy.org/stable/) to see how you can change
your request to show another location.

I have also included terminal based web browser [w3m](http://w3m.sourceforge.net/). From it you can bypass _robot_ secured Google frontpage and actually make a search from command line. Try out: `w3m google.com`. If you're into it, change proxy settings in _w3m_ and intercept the Google page request. It might be fun.

#### !WARNING!!

All you do leave a **track**, so you have to know that the first name
for this Linux flavour was BackTrack. There is also another [ParrotOS](https://www.parrotsec.org) and the one you're currently looking at is named [Kali Linux](https://www.kali.org), just so you know.