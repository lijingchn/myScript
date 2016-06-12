#!/bin/bash

apt-get update
apt-get install -y git vim
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cat > /etc/apt/sources.list <<EOF  
deb http://archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse

deb-src http://archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse

deb-src http://archive.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse

deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse

deb-src http://archive.ubuntu.com/ubuntu/ trusty-proposed main restricted universe multiverse

deb-src http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse

deb http://dk.archive.ubuntu.com/ubuntu precise main multiverse
EOF

apt-get update
apt-get install -y expect
sudo apt-get install -y libmysqlclient-dev libsmi2ldbl snmp-mibs-downloader python-dev libevent-dev \
	libxslt1-dev libxml2-dev python-pip python-mysqldb pkg-config libvirt-dev
#sudo apt-get install -y build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev
sudo apt-get install -y build-essential python-dev
sudo easy_install greenlet
sudo easy_install gevent
pip install --no-use-wheel --upgrade distribute
apt-get install -u python-requests

cd /opt
git clone -b hmi-hpfeeds https://github.com/illidanteam/illipot.git
expect "Username for 'https://github.com':"
send "lijingchn\n"
expect "Password for 'https://lijingchn@github.com':"
send "******\n"
cd /opt/illipot
python setup.py install
