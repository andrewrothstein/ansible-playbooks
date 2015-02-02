FROM andrewrothstein/docker-ansible:ubuntu_trusty
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

ENV PLAYBOOKS /ansible-playbooks
RUN mkdir -p ${PLAYBOOKS}
ADD roles ${PLAYBOOKS}/roles
ADD group_vars ${PLAYBOOKS}/group_vars
ADD docker.ini ${PLAYBOOKS}/docker.ini
ADD docker.yml ${PLAYBOOKS}/docker.yml
RUN cd ${PLAYBOOKS}; ansible-playbook -i docker.ini docker.yml
