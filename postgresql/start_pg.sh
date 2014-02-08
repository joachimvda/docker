#!/bin/bash

NEWDATADIR=/data
ORGDATAPARENT=/var/lib/postgresql/9.1
CONFDIR=/etc/postgresql/9.1/main
BINDIR=/usr/lib/postgresql/9.1/bin

# test if DATADIR is existent
if [ ! -d $NEWDATADIR ]; then
  echo "Creating Postgres data at $NEWDATADIR"
  mkdir -p $NEWDATADIR
fi

# change normal location to our data dir
if [ ! -d $ORGDATAPARENT/main.org ]; then
  cd $ORGDATAPARENT
  mv main main.old
  ln -s $NEWDATADIR $ORGDATAPARENT/main

  # allow remote connections
  echo 'host all all 0.0.0.0/0 md5' >> $CONFDIR/pg_hba.conf
  sed -i -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" $CONFDIR/postgresql.conf
fi

# test if DATADIR has content
if [ ! "$(ls -A $NEWDATADIR)" ]; then
  echo "Initializing Postgres Database at $NEWDATADIR"
  chown -R postgres:postgres $NEWDATADIR
  su postgres sh -c "$BINDIR/initdb $NEWDATADIR"
  echo 'host all all 0.0.0.0/0 md5' >> $NEWDATADIR/pg_hba.conf
  su postgres sh -c "$BINDIR/postgres --single -D $NEWDATADIR -c config_file=$CONFDIR/postgresql.conf" <<< "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';"
  su postgres sh -c "$BINDIR/postgres --single -D $NEWDATADIR -c config_file=$CONFDIR/postgresql.conf" <<< "ALTER USER postgres with encrypted PASSWORD 'postgres';"
fi


#cat $NEWDATADIR/postgresql.conf

#su postgres sh -c "$BINDIR/postgres -D $NEWDATADIR -c config_file=/etc/postgresql/9.1/main/postgresql.conf -c listen_addresses=*"
#su postgres sh -c "$BINDIR/postgres -D $NEWDATADIR -c config_file=$NEWDATADIR/postgresql.conf -c listen_addresses=*"
su postgres sh -c "$BINDIR/postgres -D $NEWDATADIR -c config_file=$CONFDIR/postgresql.conf -c listen_addresses=*"

