### joachimvda/postgresql

### inspired by https://gist.github.com/jpetazzo/5494158 and derivates
### it is expected that you mount the data directory to /data
### example run command:
### docker run -d -p 3022:22 -p 3432:5432 -v /var/docker/postgresql:/data:rw joachimvda/postgresql


from joachimvda/base-ssh

maintainer Joachim Van der Auwera <joachim@progs.be>


run apt-get -y update


# prevent apt from starting postgres right after the installation
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d

RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y -q postgresql-9.1 postgresql-contrib-9.1

# allow autostart again
RUN rm /usr/sbin/policy-rc.d

# /etc/ssl/private can't be accessed from within container for some reason
# (@andrewgodwin says it's something AUFS related)
RUN mkdir /etc/ssl/private-copy; mv /etc/ssl/private/* /etc/ssl/private-copy/; rm -r /etc/ssl/private; mv /etc/ssl/private-copy /etc/ssl/private; chmod -R 0700 /etc/ssl/private; chown -R postgres /etc/ssl/private


ADD start_pg.sh /root/
RUN chown root:root /root/start_pg.sh
RUN chmod +x /root/start_pg.sh



# add supervisord script to add run postgres
add supervisord-postgres.conf /etc/supervisor/conf.d/

expose 5432
