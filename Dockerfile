FROM python:3
MAINTAINER mcbplay1@gmail.com

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install php7.0 -y
WORKDIR /root
RUN git clone https://github.com/DarkSecDevelopers/HiddenEye.git
WORKDIR /root/HiddenEye
RUN pip3 install -r requirements.txt
RUN chmod +x HiddenEye.py
RUN ln -s /root/HiddenEye/HiddenEye.py /bin/HiddenEye
ENTRYPOINT ["python3", "/root/HiddenEye/HiddenEye.py"]
