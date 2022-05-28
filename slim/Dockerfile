FROM neosb/nutek-core:basic

WORKDIR /root

# basics
RUN apt update && apt -y install nmap curl wget

# lsd -lah /usr/share/payloadsallthethings
# use in your exploitation techniques
RUN apt update && apt install -y payloadsallthethings

# another cat, used to establish network connections
# on demand
RUN apt install -y ncat
# web proxy somehow similar to Burp Suite but in terminal
# there is also mitmweb in this package
RUN apt update && apt install -y mitmproxy

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

# cleanup after install
## nothing to run
### if you know, where to _slim_ this more, just hit me up
### with an issue on 
### [github](https://github.com/phoenix-journey/nutek-core/issues)
### or your preffered form of information exchange vessel