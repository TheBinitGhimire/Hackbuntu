#!/bin/bash -i
#This script is fully inspired by Nahamsec's script
# Author: Prashant aka Crysp
# Contact: twitter.com/TheCrysp
# Release date: Feb 24, 2021

green='\033[1;32m'
red='\x1B[31m'
printf """$red

 ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄    ▄  ▄▄▄▄▄▄▄▄▄▄   ▄         ▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄ 
▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌
▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌ ▐░▌ ▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌▐░▌░▌     ▐░▌ ▀▀▀▀█░█▀▀▀▀ ▐░▌       ▐░▌
▐░▌       ▐░▌▐░▌       ▐░▌▐░▌          ▐░▌▐░▌  ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌▐░▌    ▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌          ▐░▌░▌   ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░▌ ▐░▌   ▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌          ▐░░▌    ▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌          ▐░▌░▌   ▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌▐░▌   ▐░▌ ▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░▌       ▐░▌▐░▌       ▐░▌▐░▌          ▐░▌▐░▌  ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌    ▐░▌▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░▌       ▐░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌ ▐░▌ ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌     ▐░▐░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌
▐░▌       ▐░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌▐░▌      ▐░░▌     ▐░▌     ▐░░░░░░░░░░░▌
 ▀         ▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀    ▀  ▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀       ▀       ▀▀▀▀▀▀▀▀▀▀▀ 
                                                                                                                
"""

updateandupgrade(){
      sudo apt update -y
      sudo apt upgrade -y
}

install_prereq(){
    #Thanks Nahamsec. WE LOVE YOU
      sudo apt-get install -y libcurl4-openssl-dev
      sudo apt-get install -y libssl-dev
      sudo apt-get install -y jq
      sudo apt-get install -y ruby-full
      sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
      sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
      sudo apt-get install -y python-setuptools
      sudo apt-get install -y libldns-dev
      sudo apt-get install -y python3-pip
      sudo apt-get install -y python-dnspython
      sudo apt-get install -y git
      sudo apt-get install -y rename
      sudo apt-get install findutils
      sudo apt install -y libpcap-dev
      sudo apt install -y python-is-python3
      sudo apt-get install -y build-essential chrpath libssl-dev libxft-dev -y
      sudo apt-get install -y libfreetype6 libfreetype6-dev -y
      sudo apt-get install -y libfontconfig1 libfontconfig1-dev -y
}

install_phantom(){
    echo "Installing Phantom"
    export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
    wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/$PHANTOM_JS.tar.bz2
    sudo tar xvjf $PHANTOM_JS.tar.bz2
    sudo mv $PHANTOM_JS /usr/local/share
    sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
    phantomjs --version
    echo "Done!";
}

install_go(){
    echo "Installing GO"
    wget https://golang.org/dl/go1.16.linux-amd64.tar.gz;tar -xvf go1*; sudo mv go /usr/local;rm go1*;
    printf "export GOPATH=\$HOME/go\nexport GOROOT=/usr/local/go\nexport PATH=/usr/local/sbin/:\$GOPATH/bin:\$GOROOT/bin:\$PATH\n" >> ~/.bashrc;
    echo "Done!";
}

sourcee(){
    source ~/.bashrc;
}

install_sublist3r(){
    echo "Installing Sublist3r";
    sudo git clone https://github.com/aboul3la/Sublist3r.git
    sudo mv Sublist3r /opt/
    pip3 install -r /opt/Sublist3r/requirements.txt
    sudo ln -sfv /opt/Sublist3r/sublist3r.py /usr/local/bin/sublist3r
    echo "Done!";
}

install_amass(){
    echo "Installing Amass!"
    sudo snap install amass
    echo "Done!";
}

install_lazys3(){
    echo "Installing Lazys3"
    git clone https://github.com/TheCrysp/lazys3.git
    sudo mv lazys3/ /opt/
    sudo ln -sfv /opt/lazys3/lazys3.rb /usr/local/bin/lazys3
    chmod +x /usr/local/bin/lazys3
    echo "Done!";
}

install_gospider(){
    echo "Installing GoSpider";
    go get -u github.com/jaeles-project/gospider
    echo "Done!";
}

install_ffuf(){
    echo "Installing Ffuf"
     go get -u github.com/ffuf/ffuf
    echo "Done!";
}

install_nuclei(){
    echo "Install Nuclei"
     GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
    echo "Done!";
}


install_urlhunter(){
    echo "Install Urlhunter";
     go get -u github.com/utkusen/urlhunter
    echo "Done!";
}

install_dirsearch(){
    echo "installing dirsearch";
    git clone https://github.com/maurosoria/dirsearch.git
    sudo mv dirsearch/ /opt/
    pip3 install -r /opt/dirsearch/requirements.txt
    sudo ln -sfv /opt/dirsearch/dirsearch.py /usr/local/bin/dirsearch
    echo "Done!";
}

install_aquatone(){
    echo "Installing Aquatone"
     go get github.com/michenriksen/aquatone  
    echo "Done!";
}

install_chromium(){
    echo "Installing Chromium"
    sudo snap install Chromium
    echo "Done!";
}

install_subjack(){
    echo "Installing Subjack"
    go get github.com/haccer/subjack
    echo "Done!";
}

install_tomnomnom(){
   echo "Installing Tomnomnom's Tools"
   go get -u github.com/tomnomnom/assetfinder;
   go get -u github.com/tomnomnom/gron;
   go get -u github.com/tomnomnom/gf;
   go get -u github.com/tomnomnom/meg;
   go get -u github.com/tomnomnom/anew;
   go get -u github.com/tomnomnom/httprobe; 
   go get -u github.com/tomnomnom/fff;
   go get -u github.com/tomnomnom/rawhttp;
   go get -u github.com/tomnomnom/waybackurls;
   go get -u github.com/tomnomnom/concurl;
   go get -u github.com/tomnomnom/securitytxt;
   go get -u github.com/tomnomnom/unfurl;
   go get -u github.com/tomnomnom/burl;
   go get -u github.com/tomnomnom/qsreplace;
   go get -u github.com/tomnomnom/linkheader;
   go get -u github.com/tomnomnom/comb;
   go get github.com/tomnomnom/hacks/filter-resolved;
   go get -u github.com/tomnomnom/hacks/kxss;
   # gf Setup
   echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc;
   cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf;
   git clone https://github.com/1ndianl33t/Gf-Patterns && mv Gf-Patterns/*.json ~/.gf && rm -rf Gf-Patterns;
   echo "Done!";
}

install_awsCli(){
    echo "Installing Aws Cli"
    sudo apt install -y awscli
    echo "Done!";
}

install_JSParser(){
    echo "Installing JSParser"
    git clone https://github.com/TheCrysp/JSParser.git
    sudo mv JSParser/ /opt/
    pip3 install -r /opt/JSParser/requirements.txt
    sudo python /opt/JSParser/setup.py install
    sudo ln -sfv /opt/JSParser/handler.py /usr/local/bin/jsparser
    chmod +x /usr/local/bin/jsparser
    echo "Done!";
}

install_asnlookup(){
    echo "Installing Asnlookup"
    git clone https://github.com/yassineaboukir/Asnlookup 
    sudo mv Asnlookup/ /opt/
    pip3 install -r /opt/Asnlookup/requirements.txt
    sudo ln -sfv /opt/Asnlookup/asnlookup.py /usr/local/bin/asnlookup
    sudo chmod +x /usr/local/bin/asnlookup
    echo "Done!";
}

install_wpscan(){
    echo "Installing Wpscan"
    sudo gem install wpscan
    echo "Done!";           
}

install_FGDS(){
    echo "Installing Fast-Google-Dorks-Scan"
    git clone https://github.com/IvanGlinkin/Fast-Google-Dorks-Scan.git
    sudo mv Fast-Google-Dorks-Scan/FGDS.sh /usr/local/bin/fgds
    rm -rf Fast-Google-Dorks-Scan/
    chmod +x /usr/local/bin/fgds
    echo "Done!";
}

install_virtualhostdiscovery(){
    echo "Installing virtual-host-discovery"
    git clone https://github.com/TheCrysp/-virtual-host-discovery-.git
    sudo mv virtual-host-discovery/ /opt/
    sudo ln -sfv /opt/virtual-host-discovery/scan.rb /usr/local/bin/vhd
    sudo chmod +x /usr/local/bin/vhd
    echo "Done!";
}

install_massdns(){
    echo "Installing MassDns"
    git clone https://github.com/blechschmidt/massdns.git
    sudo mv massdns/ /opt/
    sudo make -C /opt/massdns/
    sudo cp /opt/massdns/bin/massdns /usr/local/bin/massdns
    echo "Done!"
}


install_gitrdorker(){
    echo "Installing Git Dorker"
    git clone https://github.com/obheda12/GitDorker.git
    sudo mv GitDorker/ /opt/
    sudo pip3 install -r /opt/GitDorker/requirements.txt
    sudo ln -sfv /opt/GitDorker/GitDorker.py /usr/local/bin/gitdorker
    chmod +x /usr/local/bin/gitdorker
    echo "Done!";
}

install_Seclist(){
    echo "Installing Seclist"
    git clone https://github.com/danielmiessler/SecLists 
    sudo mv SecLists/ /opt/
    echo "Done!";
}

install_feroxbuster(){
    echo "Installing Feroxbuster"
    sudo curl -sLO https://github.com/epi052/feroxbuster/releases/latest/download/x86_64-linux-feroxbuster.zip && sudo unzip x86_64-linux-feroxbuster.zip && sudo chmod +x ./feroxbuster && sudo mv ./feroxbuster /usr/local/bin/ && sudo rm -f x86_64-linux-feroxbuster.zip;
    echo "Done!";
}

install_favfreak(){
    echo "Installing FavFreak"
    git clone https://github.com/devanshbatham/FavFreak  
    chmod +x FavFreak/favfreak.py 
    sudo mv FavFreak/favfreak.py /usr/local/bin/favfreak 
    sudo rm -rf FavFreak/;
    echo "Done!";
}

install_projectdiscovery(){
    echo "Installing Project Discovery's Tools"
    GO111MODULE=on go get github.com/projectdiscovery/naabu/cmd/naabu;
    GO111MODULE=on go get -u github.com/projectdiscovery/subfinder/v2/cmd/subfinder
    GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
    GO111MODULE=auto go get -u github.com/projectdiscovery/mapcidr/cmd/mapcidr;
    GO111MODULE=on go get -u github.com/projectdiscovery/chaos-client/cmd/chaos;

    echo "Done!";
}

install_LC(){
    echo "Installing LC's Tools"
    go get -u github.com/lc/gau;
    go get -u github.com/lc/cspparse;
    GO111MODULE=on go get -u github.com/lc/subjs;
    go get github.com/lc/reckdns;
    go get -u github.com/lc/secretz;
    go get github.com/lc/otxurls;
    echo "Done!";
}

install_Hakluke(){
    echo "Installing Hakluke's Tools"
    go get github.com/hakluke/hakcheckurl;
    go get github.com/hakluke/hakrawler;
    go get github.com/hakluke/hakrevdns;
    go get github.com/hakluke/haksecuritytxt;
    go get github.com/hakluke/haktldextract;
    echo "Done!";
}

install_diggy(){
    echo "Installing Diggy"
    sudo curl https://raw.githubusercontent.com/s0md3v/Diggy/master/diggy.sh > sudo /usr/local/bin/diggy && sudo chmod +x /usr/local/bin/diggy;
    echo "Done!";
}

install_SANM(){
    echo "Installing "
    sudo apt install sqlmap apktool nmap masscan -y;
    echo "Done!";
}

install_rustc(){
    echo "Installing Rust"
    sudo apt install rustc -y
    echo "Done!";
}

install_hydra(){
    echo "Installing Hydra"
    sudo apt-get install hydra -y
    echo "Done!";
}

install_dirdar(){
    echo "Installing Dirdar"
    go get -u github.com/m4dm0e/dirdar
    echo "Done!";
}


main(){
    updateandupgrade
    install_prereq
    if ! type "phantomjs" > /dev/null; then
        install_phantom
    else
        echo "Phantomjs already installed."
    fi

    if ! command -v go &> /dev/null
    then
        install_go
    else
        echo "Go already installed."
    fi

    sourcee
    install_sublist3r
    install_amass
    install_lazys3
    install_gospider
    install_ffuf
    install_nuclei
    install_urlhunter
    install_dirsearch
    install_aquatone
    install_chromium
    install_subzy
    install_tomnomnom
    install_awsCli
    install_JSParser
    install_asnlookup
    install_wpscan
    install_FGDS
    install_virtualhostdiscovery
    install_massdns
    install_gitrdorker
    install_Seclist
    install_feroxbuster
    install_projectdiscovery
    install_LC
    install_Hakluke
    install_diggy
    install_SANM
    install_favfreak
    install_rustc
    install_hydra
    install_dirdar
}

main

echo -e "$green \nGo was installed into $GOROOT."
echo -e "$red \nMake sure to relogin into your shell or run: source ~/.bashrc to update your environment variables."
echo -e "$green \nTip: Opening a new terminal window usually just works. :) \n\n\n"
                                                                                     
