FROM kalilinux/kali-rolling:latest

WORKDIR /root

# basics
RUN apt update && apt -y install nmap curl wget

# lsd -lah /usr/share/payloadsallthethings
# use in your exploitation techniques
RUN apt update && apt install -y payloadsallthethings

# another cat, used to establish network connections
# on demand
RUN apt install -y ncat

# Python programming language
RUN apt update && apt install -y python3.10 python3-distutils
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.10

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

# Terminal version of popular fork Nvim of text editor Vim - vi Improved
# I was using it, and it's really good (https://neovim.io)
# you can use all the magic of Vim but the New School way
RUN apt update && apt install -y neovim

# cleanup after install
## nothing to run
### if you know, where to _slim_ this more, just hit me up
### with an issue on 
### [github](https://github.com/phoenix-journey/nutek-core/issues)
### or your preffered form of information exchange vessel