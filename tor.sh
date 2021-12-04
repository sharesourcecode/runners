_tor () {
	echo "Starting tor..."
	tor &
	echo "Wait 1m..."
	read -t 60
	reset; clear
}
