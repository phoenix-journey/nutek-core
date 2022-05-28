FROM kalilinux/kali-rolling:latest

WORKDIR /root

# basics
RUN apt update && apt -y install nmap curl wget

# install toolchain
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y
ENV PATH=/root/.cargo/bin:$PATH

# compilation capabilities
RUN apt update && apt -y install build-essential

# convert nmap xml report to html
RUN apt update && apt -y install xsltproc

# modern scanner
RUN cargo install rustscan

# nvd_cve vulnerebility database dependencies
RUN apt update && apt -y install pkg-config libssl-dev libsqlite3-dev
RUN cargo install nvd_cve

# website fuzzer & more
RUN apt update && apt install -y feroxbuster

# clone clone clone
RUN apt update && apt install -y git

# file used in website filename and directory discovery
RUN git clone https://github.com/phoenix-journey/fuzz.txt.git

# Python programming language
RUN apt update && apt install -y python3.10 python3-distutils
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.10

# another website discovery tool
RUN pip install raccoon-scanner

# programming language
RUN apt update && apt install -y golang
RUN export PATH="$HOME/go/bin:$PATH"
RUN export GOPATH=$HOME/go

# the fastest interweb scanner based on Shodan API
RUN go install -v github.com/s0md3v/smap/cmd/smap@latest

# nmap vulnerabilitie scanner
RUN git clone https://github.com/scipag/vulscan
RUN ln -s `pwd`/vulscan /usr/share/nmap/scripts/
RUN chmod 744 vulscan/update.sh && ./vulscan/update.sh

# ping
RUN apt update && apt install -y iputils-ping 

# password crackers
RUN apt update && apt install -y john hydra
RUN pip install hashid

RUN apt update && apt install -y nuclei

RUN apt update && apt install -y commix

RUN apt update && apt install -y metasploit-framework

RUN apt update && apt install -y sqlmap

RUN apt update && apt install -y neovim

RUN apt update && apt install -y finalrecon

RUN apt update && apt install -y gobuster

RUN apt update && apt install -y ncrack

# Garud and Garud install script that gets many modules and packeges
RUN git clone https://github.com/phoenix-journey/Garud.git 
RUN chmod +x Garud/garud Garud/install.sh 
RUN mv Garud/garud /usr/bin/
RUN ./Garud/install.sh

# RUN apt update && apt install -y payloadsallthethings
# lsd -lah /usr/share/payloadsallthethings
RUN git clone https://github.com/phoenix-journey/PayloadsAllTheThings.git
# RUN apt update && apt apt install -y seclists
# lsd -lah /usr/share/seclists
RUN git clone https://github.com/phoenix-journey/SecLists.git

# rapidscan dependencies
RUN apt update && apt install -y dnsrecon
RUN apt update && apt install -y wafw00f
RUN apt update && apt install -y uniscan
RUN apt update && apt install -y sslyze
RUN apt update && apt install -y fierce
RUN apt update && apt install -y lbd
RUN apt update && apt install -y theharvester
RUN apt update && apt install -y amass
RUN apt update && apt install -y nikto
RUN git clone https://github.com/phoenix-journey/rapidscan.git

RUN git clone https://github.com/phoenix-journey/Payloads.git

# To make rapidscan better
RUN apt update && apt install -y wapiti 
RUN apt update && apt install -y dnsmap
RUN apt update && apt install -y dnswalk
RUN apt update && apt install -y xsser 
RUN apt update && apt install -y host 
RUN apt update && apt install -y whatweb 
RUN apt update && apt install -y whois 
RUN apt update && apt install -y dnsenum 
RUN apt update && apt install -y dirb  
RUN apt update && apt install -y davtest 
RUN apt update && apt install -y dmitry

# lsd, new way of ls
RUN cargo install lsd

RUN apt install -y ncat

# save bash history to database
RUN pip install recent2
RUN echo "export PROMPT_COMMAND='log-recent -r \$? -c \"\$(HISTTIMEFORMAT= history 1)\" -p \$\$'" >> ~/.bashrc
RUN echo "source ~/.bashrc" >> /etc/profile
RUN mkdir -p ~/.nutek
RUN echo "export RECENT_DB='$HOME/.nutek/recent-bash_logs.db'" >> ~/.bashrc

# greetings
RUN echo 'echo $"::::    ::: :::    ::: ::::::::::: :::::::::: :::    ::: \n\
:+:+:   :+: :+:    :+:     :+:     :+:        :+:   :+:  \n\
:+:+:+  +:+ +:+    +:+     +:+     +:+        +:+  +:+   \n\
+#+ +:+ +#+ +#+    +:+     +#+     +#++:++#   +#++:++    \n\
+#+  +#+#+# +#+    +#+     +#+     +#+        +#+  +#+   "' >> ~/.bashrc
RUN echo "echo '#+#   #+#+# #+#    #+#     #+#     #+#        #+#   #+#  '" >> ~/.bashrc
RUN echo "echo '###    ####  ########      ###     ########## ###    ### 😼 '" >> ~/.bashrc
RUN echo "echo 'https://neosb.marketplaceinspace.com\n'" >> ~/.bashrc

# remove unnecesairly line in bash config file
RUN sed -i '/gf-completion.bash/d' .bashrc

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

# cleanup after install
RUN rm go1.18.1.linux-amd64.tar.gz