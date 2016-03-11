#!/bin/bash
current_dir=$(pwd)
yum -y install epel-release
yum -y update && yum -y upgrade
yum -y install gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel git
yum -y install wxBase.x86_64
yum -y install wget
wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
yum -y install esl-erlang
sudo chown `whoami` /opt/elixir
git clone https://github.com/elixir-lang/elixir.git /opt/elixir
ln -sf /opt/elixir elixir
cd elixir/
make clean test
sudo ln -s /opt/elixir/bin/iex /usr/local/bin/iex
sudo ln -s /opt/elixir/bin/mix /usr/local/bin/mix
sudo ln -s /opt/elixir/bin/elixir /usr/local/bin/elixir
sudo ln -s /opt/elixir/bin/elixirc /usr/local/bin/elixirc
cd $current_dir

