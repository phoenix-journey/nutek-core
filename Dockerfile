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

# the fastest interweb scanner based on Shodan API
RUN go install -v github.com/s0md3v/smap/cmd/smap@latest

# vulnerebilitie scanner
RUN git clone https://github.com/scipag/vulscan
RUN ln -s `pwd`/vulscan /usr/share/nmap/scripts/
RUN chmod 744 vulscan/update.sh && ./vulscan/update.sh