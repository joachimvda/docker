### joachimvda/mongodb

### it is expected that you mount the data directory to /data
### link using the command line like "-v /var/docker/mongodb:/data:rw"
### example run command:
### docker run -d -p 1722:22 -p 1717:27017 -p 1718:28017 -v /var/docker/mongodb:/data:rw joachimvda/mongodb


from joachimvda/base-ssh

maintainer Joachim Van der Auwera <joachim@progs.be>

# add a user
run adduser --disabled-password --gecos "" mongodb


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Hack for initctl not being available in Ubuntu
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get update -y
RUN apt-get install -y mongodb-10gen

RUN mkdir -p /data/db
RUN chown -R mongodb:mongodb /data


# add supervisord script to add run teamcity
add supervisord-mongodb.conf /etc/supervisor/conf.d/

expose 27017
expose 28017


