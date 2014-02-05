### joachimvda/teamcity/teamcity-server

### it is expected that this build has the teamcity unpacked and configured in ~/teamcity
### link using the command line like "-v /var/docker/teamcity-server:/home/teamcity:rw"
### example run command:
### docker run -d -p 1122:22 -p 1180:8111 -v /var/docker/teamcity-server:/home/teamcity:rw joachimvda/teamcity/teamcity-server


from joachimvda/base/java7

maintainer Joachim Van der Auwera <joachim@progs.be>

# add a user
run adduser --disabled-password --gecos "" teamcity

# add supervisord script to add run teamcity
add supervisord-teamcity-server.conf /etc/supervisor/conf.d/



expose 8111


