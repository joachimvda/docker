### joachimvda/teamcity/teamcity-agent

### it is expected that this build has the teamcity unpacked buildAgent directory (others can be removed) ~/teamcity
### make sure to configure TeamCity/buildAgent/conf/buildAgent.properties to allow the build agent to contact the server
### link using the command line like "-v /var/docker/teamcity-agentX:/home/teamcity:rw"
### example run command:
### docker run -d -p 1222:22 -p 1290:9090 -v /var/docker/teamcity-agentX:/home/teamcity:rw joachimvda/teamcity/teamcity-agent


from joachimvda/base/java8

maintainer Joachim Van der Auwera <joachim@progs.be>

# add a user
run adduser --disabled-password --gecos "" teamcity

# add supervisord script to add run teamcity
add supervisord-teamcity-agent.conf /etc/supervisor/conf.d/



expose 9090


