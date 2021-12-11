_clandungeon () {
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clandungeon/?close" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC ) &
	_timexit 20
	while $(grep -q '/clandungeon/attack/' $TMP/SRC) ; do
		echo "$(sed -n '1p' <<<$(grep -o -P '(http://furiadetitas.net/clandungeon/attack/\Wr\W\d+)' $TMP/SRC))" >$TMP/URL
		( torsocks lynx -dump -cfg=$TMP/$c/cfg "$(cat $TMP/URL)" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/SRC) &
		_timexit 10
		sleep 1s
	done
}
