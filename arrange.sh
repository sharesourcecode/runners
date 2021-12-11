_arrange () {
	Lnl=$(cat $TMP/usernames.txt | wc -l)
	nl=1
	for num in `seq $Lnl -1 $nl`;
	do
		usernames=$(cat $TMP/usernames.txt | awk '{print tolower($0)}' | tail -n $Lnl | head -n 1)
		[[ -n $usernames ]] && {
#create array
			ACCOUNT+=("$usernames")
			Lnl=$[$Lnl-1]
		}
		sleep 1s
	done
	reset; clear
}
