# /clan id
_clanid () {
	( torsocks lynx -dump -cfg=$TMP/$c/cfg "http://furiadetitas.net/clan" -useragent="$(shuf -n1 $TMP/$c/.ua)" >$TMP/CLD ) &
	_timexit 20
	CLD=$(cat $TMP/CLD | sed "s/\/clan\//\\n/g" | grep 'built\/' | awk -F\/ '{ print $1 }')
}
