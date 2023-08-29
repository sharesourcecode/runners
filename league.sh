_league () {
#league
	_lstart () {
		for num in `seq 5 -1 1`; do
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/league" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 20
			grep -q 'agi Agilidade: 50' <<<$(grep 'agi Agilidade:' $TMP/SRC | sed -n '4p') && {
				URL=$(sed -n '4p' <<<$(grep -o -P '(http://furiadetitas.net/league/fight/\d+/\Wr=\d+)' $TMP/SRC))
				( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
				_timexit 10
			} || {
				grep -q 'agi Agilidade: 50' <<<$(grep 'agi Agilidade:' $TMP/SRC | sed -n '3p') && {
					URL=$(sed -n '3p' <<<$(grep -o -P '(http://furiadetitas.net/league/fight/\d+/\Wr=\d+)' $TMP/SRC))
					( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
					_timexit 10
				} || {
					grep -q 'agi Agilidade: 50' <<<$(grep 'agi Agilidade:' $TMP/SRC | sed -n '2p') && {
						URL=$(sed -n '2p' <<<$(grep -o -P '(http://furiadetitas.net/league/fight/\d+/\Wr=\d+)' $TMP/SRC))
						( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
						_timexit 10
					} || {
						grep -q 'agi Agilidade: 50' <<<$(grep 'agi Agilidade:' $TMP/SRC | sed -n '1p') && {
							URL=$(sed -n '1p' <<<$(grep -o -P '(http://furiadetitas.net/league/fight/\d+/\Wr=\d+)' $TMP/SRC))
							( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
							_timexit 10
						}
					}
				}
			}
			sleep 1s
		done
	}
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/league" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	grep -q 'Lutas disponiveis: 5' $TMP/SRC && {
#quest take help
		( torsocks lynx -source -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
		_timexit 20
		grep -q '/quest/take/1' $TMP/SRC
		take1=$?
		grep -q '/quest/help/2' $TMP/SRC
		help2=$?
		grep -q '/quest/take/2' $TMP/SRC
		take2=$?
		grep -q '/quest/help/1' $TMP/SRC
		help1=$?
		grep -q -o -P '(\W\W/span\W \Wspan class\W\Wgreen(.*)/clan/\d{1,4}/quest/\w{3,10}/1)' $TMP/SRC
		closeONE=$?
		grep -q -o -P '(\W\W/span\W \Wspan class\W\Wgreen(.*)/clan/\d{1,4}/quest/\w{3,10}/2)' $TMP/SRC
		closeTWO=$?
		[[ $closeONE != 0 && $take1 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/take/1" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
			echo "$c" >$TMP/LEAGUE1
		}
		[[ $closeTWO != 0 && $help2 = 0 ]] && {
			[[ $close = 0 ]] && _close
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/help/2" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
		[[ $closeONE != 0 && $take1 = 0 || $closeTWO != 0 && $help2 = 0 ]] && {
			_lstart
		}
# help 1		
		[[ $closeTWO != 0 && $take2 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/take/2" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
			echo "$c" >$TMP/LEAGUE2
		}
		[[ $closeONE != 0 && $help1 = 0 ]] && {
			[[ $closeONE = 0 ]] && _close
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/help/1" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
		[[ $closeTWO != 0 && $take2 = 0 || $closeONE != 0 && $help1 = 0 ]] && {
			_lstart
		}
#quest end deleteHelp
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
		_timexit 20
		grep -q '/quest/deleteHelp/1' $TMP/SRC
		deleteHelp1=$?
		grep -q '/quest/end/2' $TMP/SRC
		end2=$?
		[[ $deleteHelp1 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/deleteHelp/1" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
		[[ $end2 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/end/2" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
		grep -q '/quest/deleteHelp/2' $TMP/SRC
		deleteHelp2=$?
		grep -q '/quest/end/1' $TMP/SRC
		end1=$?
		[[ $deleteHelp2 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/deleteHelp/2" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
		[[ $end1 = 0 ]] && {
			( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan/$CLD/quest/end/1" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
			_timexit 10
		}
	}
}
