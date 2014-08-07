FROM andrewrothstein/docker-ansible
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

ADD playbook.yml .
ADD hosts .
RUN ansible-playbook --connection=local -i hosts playbook.yml

WORKDIR /home/drew
