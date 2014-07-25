FROM ubuntu
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev
RUN pip install ansible

ADD playbook.yml .
ADD hosts .
RUN ansible-playbook --connection=local -i hosts playbook.yml

WORKDIR /home/drew
