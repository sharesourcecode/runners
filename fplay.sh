#!/bin/bash
FUNC=$1
mkdir -p $HOME/runners
DIR=$HOME/runners
mkdir -p $HOME/.tmp/runners
TMP=$HOME/.tmp/runners
cd $HOME/runners
>$TMP/LEAGUE1
>$TMP/LEAGUE2
>$TMP/CAREER
#sources
. clanid.sh ; . fullarena.sh ; . arena.sh ; . arrange.sh ; . career.sh ; . clandungeon.sh ; . close.sh
. league.sh ; . login.sh ; . timexit.sh ; . tor.sh
_tor
_login
_arrange
#tasks
while true ;
do
	for c in "${ACCOUNT[@]}"; do
		acc=$[$acc+1]
#clanid
		_clanid
#trade
		( torsocks lynx -cfg=$TMP/$c/cfg -cmd_script=$DIR/task/trade "http://furiadetitas.net/trade/exchange" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
		_timexit 20
		_fullarena
		sleep 1s
		pkill -sighup tor
		reset; clear
		echo "fullarena: $acc"
	done
	acc=0
	pkill -9 lynx
	pkill -sighup tor
	exit
done
