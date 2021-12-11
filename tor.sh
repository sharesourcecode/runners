_tor () {
	echo "Starting tor..."
	tor &
	echo "Wait 1m..."
	sleep 10s
	read -t 50
	reset; clear
}
