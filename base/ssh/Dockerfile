### joachimvda/base-ssh

from joachimvda/base-secured

maintainer Joachim Van der Auwera <joachim@progs.be>

# add a user
run adduser --disabled-password --gecos "" joachim
run echo 'joachim:joachim' | chpasswd
run usermod -a -G sudo joachim

# SSH base
run apt-get -y install openssh-server

# Setup
run mkdir -p /var/run/sshd

# Prepare
run mkdir -p /home/joachim/.ssh && chown joachim:joachim /home/joachim/.ssh && chmod 0700 /home/joachim/.ssh

# Secure configuration - disable password authentication, no root login
RUN sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
RUN sed -i -e "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

# Add files
add supervisord-ssh.conf /etc/supervisor/conf.d/
add authorized_keys /home/joachim/.ssh/
run chown joachim:joachim /home/joachim/.ssh/authorized_keys && chmod 0600 /home/joachim/.ssh/authorized_keys

cmd ["/usr/bin/supervisord", "-n"]

expose 22

