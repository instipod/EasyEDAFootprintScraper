FROM ubuntu:20.04
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y software-properties-common python3 python3-pip npm git
RUN apt install -y libgtk2.0-dev openctm-tools
RUN add-apt-repository --yes ppa:kicad/kicad-6.0-releases
RUN apt update
RUN apt install -y --install-recommends kicad
RUN npm install -g easyeda2kicad
RUN git clone https://github.com/yaqwsx/EasyEDAFootprintScraper.git
RUN pip3 install requests click
COPY fetchComponent.py /fetchComponent.py

WORKDIR /output
ENTRYPOINT ["/usr/bin/python3", "/fetchComponent.py"]
