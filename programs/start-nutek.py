#!/usr/bin/python3

import os, sys
import getopt
from pathlib import Path

def version():
    return '1.0.0'

def usage():
    help = """
start-nutek helper v{} 🚀

‼️  Docker is required to run nutek-core ‼️

Start instance of nutek-core:slim docker container in your terminal.

Available tools:
🥷 Kali Linux                from docker image kalilinux/kali-rolling:latest
🥷 recent2                   bash commands history in SQLite
🥷 curl & wget               web interactions tools, wget to download, and curl to
    see what web request response is. Can be used to interct with API's
🥷 Python 3.10               general purpose programming language (https://python.org)
🥷 Perl 5                    another programming language (https://www.perl.org/)
🥷 PayloadsAllTheThings      payloads to use in exploiting vulnerabilites
    look in /usr/share/payloadsallthethings folder
🥷 Ncat                      'is a feature-packed networking utility which reads and writes data 
    across networks from the command line' (https://nmap.org/ncat/)
🥷 NeoVim                    terminal based text-editor ready to extend. Vim compatible.
🥷 w3m                       command line web browser
🥷 mitmproxy                 woman in the middle proxy to forward web traffic through
    fire it up and go to http://mitm.it/, follow instructions to install certificate
    check up manual on https://docs.mitmproxy.org/stable/
🥷 hURL                      encode/decode text and files

Arguments:
-h | --help         display this message
-s | --start        start container <name> again 
-p | --port         <host port for port 8080 used by mitmproxy in docker container> default to 8080
-c | --command      <command to run> (multiword enclosed in '' e.g. 'echo "lol"')
-n | --name         <name of container> set to r if random, default to nutek-core
--rm                remove container after exiting from it
-v | --version      version of start-nutek helper

Neosb & 😼 https://neosb.marketplaceinspace.com""".format(version())
    print(help)

def main(argv):
    name = '--name nutek-core'
    host_port = '8080'
    command = ''
    try:
        opts, args = getopt.getopt(
            argv,
            "hp:c:n:s:v",
            ["help", "port=", "command=", "name=", "rm", "start=", "version"]
            )
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)
    rm = False
    for opt, arg in opts:
        if opt in ('-h', '--help'):
            usage()
            sys.exit()
        if opt in ('-v', '--version'):
            print(f"start-nutek helper v{version()}")
            sys.exit()
        if opt in ('-p', '--port'):
            host_port = arg
        if opt in ('-c', '--command'):
            command = arg
        if opt in ('-n', '--name'):
            if arg == 'r':
                name = ''
            else:
                name = "--name " + arg
        if opt == '--rm':
            rm = True
        if opt in ('-s', '--start'):
            os.system("docker start --interactive " + arg)
            sys.exit()
    home = str(Path.home())
    docker_command =  "-it " + name + " -h nutek-core -p " + host_port + ":8080 -v $HOME/.nutek:/root/.nutek neosb/nutek-core:slim " + command
    if rm:
        docker_command = f"--rm {docker_command}"
    docker_command = f"docker run {docker_command}"
    if os.path.isdir(home + "/.nutek"):
        os.system(docker_command)
    else:
        os.mkdir(home + "/.nutek")
        os.system(docker_command)

if __name__ == "__main__":
   main(sys.argv[1:])