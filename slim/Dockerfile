FROM neosb/nutek-core:base

WORKDIR /root

# basics
RUN apt update && apt -y install nmap curl wget

# lsd -lah /usr/share/payloadsallthethings
# use in your exploitation techniques
RUN apt update && apt install -y payloadsallthethings

# usr/share/seclists
# lists for fuzzing, passwords, discovery
RUN apt update && apt install seclists

# another cat, used to establish network connections
# on demand
RUN apt install -y ncat
# web proxy somehow similar to Burp Suite but in terminal
# there is also mitmweb in this package
RUN apt update && apt install -y mitmproxy
RUN curl http://mitm.it/cert/pem > mitmproxy.crt
RUN mv mitmproxy.crt /usr/local/share/ca-certificates/mitmproxy.crt
RUN update-ca-certificates

# various encoding and decoding strings tool
RUN apt update && apt install -y hurl

# Terminal based web browser
# manual - http://w3m.sourceforge.net/MANUAL
# it has a proxy setting, so that you can use it with mitmproxy
RUN apt update && apt install -y w3m
# make w3m storage directory
RUN mkdir ~/.w3m
# Unicode in w3m web browser
RUN echo 'display_charset UTF-8' >> ~/.w3m/config 

# Terminal version of popular fork Nvim of text editor Vim - vi Improved
# I was using it, and it's really good (https://neovim.io)
# you can use all the magic of Vim but the New School way
RUN apt update && apt install -y neovim
RUN mkdir -p /root/.config/nvim/ && touch /root/.config/nvim/init.vim
RUN echo "set number" >> /root/.config/nvim/init.vim
# locales & UTF-8
RUN apt update && apt install -y locales
RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
RUN echo "export LANG=en_US.UTF-8" >> ~/.bashrc
RUN echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc

RUN apt install -y build-essential

# install toolchain
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y
ENV PATH=/root/.cargo/bin:$PATH

# API explorer similar to HTTPie
RUN cargo install xh

# Fuzzer like gobuster
RUN cargo install feroxbuster

# Git
RUN apt install -y git

# nmap vulnerabilitie scanner
RUN git clone https://github.com/scipag/vulscan
RUN ln -s `pwd`/vulscan /usr/share/nmap/scripts/
RUN chmod 744 vulscan/update.sh && ./vulscan/update.sh

# Go programming language
RUN apt update && apt install -y golang
RUN export PATH="$HOME/go/bin:$PATH"
RUN export GOPATH=$HOME/go

# the fastest interweb scanner based on Shodan API
RUN go install -v github.com/s0md3v/smap/cmd/smap@latest

# sniff network packets
RUN apt install -y tcpdump

# cleanup after install
## nothing to run
### if you know, where to _slim_ this more, just hit me up
### with an issue on 
### [github](https://github.com/phoenix-journey/nutek-core/issues)
### or your preffered form of information exchange vessel