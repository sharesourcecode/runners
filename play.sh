#!/bin/bash
FUNC=$1
mkdir -p $HOME/runners
DIR=$HOME/runners
mkdir -p $HOME/.tmp/runners
[[ -z $FUNC ]] && {
	[[ -e ~/.tmp/runners/login.txt ]] && {
		nano ~/.tmp/runners/login.txt
	} || {
		> ~/.tmp/runners/login.txt
		nano ~/.tmp/runners/login.txt
	}
}
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
echo -e "forum/topic/105103\nchat/titans/changeRoom/\narena\nsage\nquest\nmedals\ncollector\nrelic\ncave\naltars\nclancoliseum\nclanfight\nfights/timetable/\nrating/coll/\ncampaign\nshop\nmaneken\nrunes\nsmith/smith/\nitembonus/\nstars/\nrings/\nlab\neffshop/\nuser/\nachievement\nequip\npetshop\nability\ninv/chest/\nmail/\nusergift/\ngiftshop\ntrain\n/" >$TMP/CLOSE
while true ;
do
	for c in "${ACCOUNT[@]}"; do
		acc=$[$acc+1]
#clan id
		_clanid
		case $(date +%w) in
			([1-5])
				_career
				_league ;;
		esac
#		_trade
		_arena
		_clandungeon
#trade
		case $(date +%H) in
			(00|06|12|18)
				( torsocks lynx -cfg=$TMP/$c/cfg -cmd_script=$DIR/task/trade "http://furiadetitas.net/trade/exchange" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
				_timexit 20
#clan money
				( torsocks lynx -cfg=$TMP/$c/cfg -cmd_script=$DIR/task/money "http://furiadetitas.net/clan/$CLD/money" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
				_timexit 20 ;;
		esac
		close=1
#undying
		case $(date +%H:%M) in
			(09:[4-5][0-9]|15:[4-5][0-9]|21:[4-5][0-9])
					( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/undying/enterGame" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
					_timexit 10
					close=0 ;;
		esac
#king
		case $(date +%H:%M) in
			(12:[1-2][0-9]|16:[1-2][0-9]|22:[1-2][0-9])
					( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/king/enterGame" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
					_timexit 10
					close=0 ;;
		esac
		[[ $close = 1 ]] && {
			CLOSE=$(shuf -n1 $TMP/CLOSE)
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/$CLOSE" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
			_timexit 10
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/$CLOSE" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
			_timexit 10
		}
#		torsocks lynx -dump -cfg=$TMP/$c/cfg -cmd_script=$DIR/task/arena "http://furiadetitas.net/arena" -useragent="$(shuf -n1 $TMP/$c/.ua)"
		pkill -sighup tor
		sleep 1s
	done
#	_close
	acc=0
	sleep 20m
	pkill -9 lynx
	pkill -sighup tor
	sleep 1s
done
