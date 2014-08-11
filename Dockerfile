FROM andrewrothstein/docker-ansible
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

# Hack for initctl
# See: https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

ADD playbook.yml .
ADD hosts .
RUN ansible-playbook --connection=local -i hosts playbook.yml

WORKDIR /home/drew
USER drew
