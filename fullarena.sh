_fullarena () {
#arena
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/arena" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
#atk1
	URL=$(sed -n '1p' <<<$(grep -o -P '(http://furiadetitas.net/arena/attack/1/\Wr\W\d+)' $TMP/SRC))
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
#full atk
	URL=$(grep -o -P '(http://furiadetitas.net/arena/lastPlayer/\W\w\W\d+\W\w+\W\w+)' $TMP/SRC)
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
#12x atks
	for num in `seq 1 +1 12`; do
		URL=$(grep -o -P '(http://furiadetitas.net/arena/lastPlayer/\Wr\W\d+\Wfullmana\Wtrue\Wheal\Wtrue)' $TMP/SRC)
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "$URL" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
		_timexit 20
		sleep 1s
	done
#sell bag itens
#	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/inv/bag/sellAll/1/" -useragent="$(shuf -n1 $TMP/$c/.ua)" ) &
#	_timexit 20
}
