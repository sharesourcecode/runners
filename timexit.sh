_timexit () {
	( td=$(echo $((${@} / 2)))
	for te in `seq ${@} -1 0`;
	do
		sleep 1
		grep -q -o $! <<<$(ps ax -o pid=,args=) || break 2> /dev/null
		[ $te == 1 ] && {
			kill -9 $! 2> /dev/null;
			echo -e "\033[31m\033[01mConnection error!\e[00m";
			break 2> /dev/null
		}
		[ $te == $td ] && {
			echo -e "\033[33m\033[02mSlow connection.\e[00m";
		}
	done )
}
