#!/bin/bash
USER_NAME=${1:-ehazlett}

if [ -e "/usr/bin/apt-get" ] ; then
	apt-get update
	DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
	    build-essential \
	    gcc \
	    git-core \
	    make \
	    python \
	    python-dev \
	    python-setuptools \
	    autoconf \
	    gawk \
	    libncurses5-dev \
	    libssl-dev \
	    mercurial \
	    aufs-tools \
	    libbz2-dev \
	    libreadline-dev \
	    lxc \
	    gettext \
	    htop \
	    wget \
	    sysstat \
	    curl \
	    socat \
	    ctags \
	    libsqlite3-dev \
	    libdevmapper-dev \
	    rng-tools \
	    s3cmd \
	    apache2-utils \
	    libcurl4-openssl-dev
fi

if [ -e "/usr/bin/yum" ] ; then
	yum -y update
	yum -y install \
		kernel-devel \
		gcc \
		gcc-c++ \
		make \
		dyninst \
		elfutils-libs \
		python-devel \
		setuptools \
		gawk \
		ncurses-devel \
		openssl-devel \
		mercurial \
		bzip2-devel \
		readline-devel \
		gettext \
		htop \
		wget \
		curl \
		sqlite3-devel \
		device-mapper-devel \
		rng-tools \
		s3cmd \
		httpd-tools \
		curl-devel
fi

export USER_NAME=$USER_NAME

cd /home/$USER_NAME

git clone https://github.com/ehazlett/.dotfiles
cd .dotfiles
git submodule update --init

/bin/bash config.sh
