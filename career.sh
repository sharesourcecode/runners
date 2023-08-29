_career () {
	_cstart () {
#career
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/career" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
		_timexit 20
		while $(grep -q '/career/attack' $TMP/SRC) ; do
			echo "$(sed -n '1p' <<<$(grep -o -P '(http://furiadetitas.net/career/attack/\Wr\W\d+)' $TMP/SRC))" >$TMP/URL
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "$(cat $TMP/URL)" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC) &
			_timexit 10
			sleep 1s
		done
	}
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/career" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	grep -q 'Atacar 0/5' $TMP/SRC && {
#quest take help
		( torsocks lynx -source -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
		_timexit 20
		grep -q '/quest/take/6' $TMP/SRC
		take6=$?
		grep -q '/quest/help/6' $TMP/SRC
		help6=$?
		grep -q -o -P '(\W\W/span\W \Wspan class\W\Wgreen(.*)/clan/\d{1,4}/quest/\w{3,10}/6)' $TMP/SRC
		close=$?
		[[ $close != 0 && $take6 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/take/6" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
			echo "$c" >$TMP/CAREER
		}
		[[ $close != 0 && $help6 = 0 ]] && {
			[[ $close = 0 ]] && _close
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/help/6" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
		[[ $close != 0 && $take6 = 0 || $close != 0 && $help6 = 0 ]] && {
			_cstart
		}
#quest end deleteHelp
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
		_timexit 20
		grep -q '/quest/deleteHelp/6' $TMP/SRC
		deleteHelp6=$?
		grep -q '/quest/end/6' $TMP/SRC
		end6=$?
		[[ $deleteHelp6 = 0 || $end6 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/deleteHelp/6" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/end/6" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
	}
}
