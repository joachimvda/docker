### joachimvda/base/secured

# secure a box
# based on http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers

# Yes, we are running LTS
from joachimvda/base/baremetal

# Joachim is in charge
maintainer Joachim Van der Auwera <joachim@progs.be>

# monitor login attempts to a server and block suspicious activity as it occurs
run apt-get install -y fail2ban

# need sudo to prevent need for a root password
run apt-get install -y sudo

# no firewall (ufw), this is automatic in docker setup
