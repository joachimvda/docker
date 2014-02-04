### joachimvda/base/java8

from joachimvda/base/ssh

maintainer Joachim Van der Auwera <joachim@progs.be>

RUN apt-get -y install python-setuptools python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && apt-get -y upgrade

# automatically accept oracle license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# and install java 7 oracle jdk
RUN apt-get -y install oracle-java8-installer && apt-get clean
RUN update-alternatives --display java 
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

