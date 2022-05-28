# nutek-core:base_latest

FROM kalilinux/kali-rolling:latest

WORKDIR /root

# basics
RUN apt update && apt -y install curl

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
