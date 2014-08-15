FROM andrewrothstein/docker-emacs
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

# Hack for initctl
# See: https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

ADD playbook.yml .
RUN ansible-playbook playbook.yml

WORKDIR /home/drew
USER drew
