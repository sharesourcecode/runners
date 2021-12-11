_arena () {
#	$TMP/SRC
#quest help
	( torsocks lynx -source -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	grep -q '/quest/take/3' $TMP/SRC && {
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/take/3" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
		_timexit 10
		echo "$c" >$TMP/ARENA3
	}	
	grep -q '/quest/take/4' $TMP/SRC && {
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/take/4" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
		_timexit 10
		echo "$c" >$TMP/ARENA4
	}
	grep -q -o -P '(\W\W/span\W \Wspan class\W\Wgreen(.*)/clan/\d{1,4}/quest/\w{3,10}/3)' $TMP/SRC || {
		grep -q '/quest/help/3' $TMP/SRC && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/help/3" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
			_timexit 10
		}
	}
	grep -q -o -P '(\W\W/span\W \Wspan class\W\Wgreen(.*)/clan/\d{1,4}/quest/\w{3,10}/4)' $TMP/SRC || {
		grep -q '/quest/help/4' $TMP/SRC && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/help/4" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
			_timexit 10
		}
	}	
#arena
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/arena" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	URL=$(sed -n '1p' <<<$(grep -o -P '(http://furiadetitas.net/arena/attack/1/\Wr\W\d+)' $TMP/SRC))
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	URL=$(grep -o -P '(http://furiadetitas.net/arena/lastPlayer/\W\w\W\d+\W\w+\W\w+)' $TMP/SRC)
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/inv/bag/sellAll/1/" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
	_timexit 20
#quest delete help
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	grep -q '/quest/deleteHelp/3' $TMP/SRC && {
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/deleteHelp/3" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
		_timexit 20
	}
	grep -q '/quest/deleteHelp/4' $TMP/SRC && {
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/deleteHelp/4" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
		_timexit 20
	}
	grep -q '/quest/end/3' $TMP/SRC && {
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/end/3" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
		_timexit 10
	}
	grep -q '/quest/end/4' $TMP/SRC && {
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/end/4" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
		_timexit 10
	}
#fault
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/fault/?group=2" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	while $(grep -q '/fault/attack' $TMP/SRC) ; do
		URL=$(sed -n '1p' <<<$(grep -o -P '(http://furiadetitas.net/fault/attack/\Wr\W\d+)' $TMP/SRC))
		(torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
		_timexit 10
		sleep 1s
	done
}
