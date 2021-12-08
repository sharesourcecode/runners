_close () {
#LEAGUE1
	[[ -f $TMP/LEAGUE1 && -s $TMP/LEAGUE1 ]] && {
		( torsocks lynx -dump -cfg=$TMP/`cat $TMP/LEAGUE1`/cfg "http://furiadetitas.net/clan/$CLD/quest/end/1" -useragent="$(shuf -n1 $TMP/`cat $TMP/LEAGUE1`/.ua)" ) &
		_timexit 10
		>$TMP/LEAGUE1
	}
#LEAGUE2
	[[ -f $TMP/LEAGUE2 && -s $TMP/LEAGUE2 ]] && {
		( torsocks lynx -dump -cfg=$TMP/`cat $TMP/LEAGUE2`/cfg "http://furiadetitas.net/clan/$CLD/quest/end/2" -useragent="$(shuf -n1 $TMP/`cat $TMP/LEAGUE2`/.ua)" ) &
		_timexit 10
		>$TMP/LEAGUE2
	}
#CAREER
	[[ -f $TMP/CAREER && -s $TMP/CAREER ]] && {
		( torsocks lynx -dump -cfg=$TMP/`cat $TMP/CAREER`/cfg "http://furiadetitas.net/clan/$CLD/quest/end/6" -useragent="$(shuf -n1 $TMP/`cat $TMP/CAREER`/.ua)" ) &
		_timexit 10
		>$TMP/CAREER
	}
#ARENA3
	[[ -f $TMP/ARENA3 && -s $TMP/ARENA3 ]] && {
		( torsocks lynx -dump -cfg=$TMP/`cat $TMP/ARENA3`/cfg "http://furiadetitas.net/clan/$CLD/quest/end/3" -useragent="$(shuf -n1 $TMP/`cat $TMP/ARENA3`/.ua)" ) &
		_timexit 10
		>$TMP/ARENA3
	}
#ARENA4
	[[ -f $TMP/ARENA4 && -s $TMP/ARENA4 ]] && {
		( torsocks lynx -dump -cfg=$TMP/`cat $TMP/ARENA4`/cfg "http://furiadetitas.net/clan/$CLD/quest/end/4" -useragent="$(shuf -n1 $TMP/`cat $TMP/ARENA4`/.ua)" ) &
		_timexit 10
		>$TMP/ARENA4
	}
}
