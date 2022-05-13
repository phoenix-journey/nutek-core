FROM kalilinux/kali-rolling:latest

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

# programming language
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

# vulnerebilitie scanner
RUN git clone https://github.com/scipag/vulscan
RUN ln -s `pwd`/vulscan /usr/share/nmap/scripts/
RUN chmod 744 vulscan/update.sh && ./vulscan/update.sh

RUN apt install -y iputils-ping 

RUN apt install -y john hydra
RUN pip install hashid

RUN apt install -y nuclei

RUN apt install -y commix

RUN apt install -y metasploit-framework

RUN apt install -y sqlmap

RUN apt install -y vim

RUN apt install -y finalrecon

RUN apt install -y gobuster

RUN apt install -y ncrack

RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN apt install -y sublist3r
RUN go get -u github.com/tomnomnom/waybackurls
RUN go get -u github.com/tomnomnom/gf
RUN go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
RUN go get -u github.com/tomnomnom/assetfinder
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN go get github.com/Emoe/kxss
RUN go install github.com/hahwul/dalfox/v2@latest
RUN go install -v github.com/tomnomnom/anew@latest
RUN go install -v github.com/projectdiscovery/notify/cmd/notify@latest
RUN go install -v github.com/OWASP/Amass/v3/...@master
RUN go install github.com/lc/gau/v2/cmd/gau@latest
RUN curl -sSfL https://git.io/crlfuzz | sh -s -- -b /usr/local/bin
RUN pip install uro
RUN go install github.com/ffuf/ffuf@latest
RUN apt install -y libpcap-dev
RUN go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
RUN go get github.com/cgboal/sonarsearch/cmd/crobat
RUN go get -u github.com/jaeles-project/gospider
RUN go install github.com/tomnomnom/waybackurls@latest
RUN git clone https://github.com/R0X4R/Garud.git && cd Garud/ && chmod +x garud install.sh && mv garud /usr/bin/ && ./install.sh

RUN git clone https://github.com/phoenix-journey/PayloadsAllTheThings.git
RUN git clone https://github.com/phoenix-journey/SecLists.git

RUN apt install -y dnsrecon
RUN apt install -y wafw00f
RUN apt install -y uniscan
RUN apt install -y sslyze
RUN apt install -y fierce
RUN apt install -y lbd
RUN apt install -y theharvester
RUN apt install -y amass
RUN apt install -y nikto
RUN git clone https://github.com/phoenix-journey/rapidscan.git