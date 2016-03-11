#!/bin/bash
current_dir=$(pwd)
cd
sudo yum -y install epel-release
sudo yum -y update && yum -y upgrade
sudo yum -y install gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel git
sudo yum -y install wxBase.x86_64
sudo yum -y install wget
wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
yum -y install esl-erlang
sudo git clone https://github.com/elixir-lang/elixir.git /opt/elixir
sudo chown `whoami` /opt/elixir
ln -sf /opt/elixir elixir
cd elixir/
make clean test
sudo ln -s /opt/elixir/bin/iex /usr/local/bin/iex
sudo ln -s /opt/elixir/bin/mix /usr/local/bin/mix
sudo ln -s /opt/elixir/bin/elixir /usr/local/bin/elixir
sudo ln -s /opt/elixir/bin/elixirc /usr/local/bin/elixirc
cd $current_dir


mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

ruby install.rb
sudo yum -y install ctags
sudo yum -y install cmake
sudo yum -y install python-devel

cd ~/.vim/bundle/YouCompleteMe/
./install.py
cp .vimrc ~/


