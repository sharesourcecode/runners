#!/bin/bash
echo -e "\e[01;36m\e[01;07m\n Upgrading...\n👉 Please wait...☕👴\e[00m"
# /OS packages
APT="apt"
# /termux
termux-wake-lock &> /dev/null && {
	LS="/data/data/com.termux/files/usr/share/doc"
	rm -rf ~/.termux/boot/runners.sh 2> /dev/null
	mkdir -p ~/.termux/boot
	echo "IyEvZGF0YS9kYXRhL2NvbS50ZXJtdXgvZmlsZXMvdXNyL2Jpbi9zaApiYXNoIH4vcnVubmVycy9wbGF5LnNoIC1ib290Cg==" | base64 -d > ~/.termux/boot/runners.sh
	chmod +x ~/.termux/boot/runners.sh 2> /dev/null
	ls $LS | grep -q "termux-api" || pkg install termux-api -y &> /dev/null
	ls "$LS" | grep -q ncurses-utils || pkg install ncurses-utils -y &> /dev/null
	APT="pkg"
} || LS="/usr/share/doc"
# /cygwin
uname | grep -q -i cygwin && {
	ls /bin | grep -q apt-cyg || {
		curl -q -L -O "http://raw.githubusercontent.com/sharesourcecode/apt-cyg/master/apt-cyg" &> /dev/null
		install apt-cyg /bin
	}
	APT="apt-cyg"
}
# /linux
ls "$LS" | grep -q lynx || {
	"$APT" install lynx -y || {
		echo -e "Please install with:\nsudo apt update\n sudo apt install openssl openssl-tool coreutils ncurses-term procps nano lynx tor torsocks -y"
		exit
	}
}
ls "$LS" | grep -q openssl || {
	"$APT" install openssl -y &> /dev/null
	"$APT" install openssl-tool -y &> /dev/null
}
ls "$LS" | grep -q nano || "$APT" install nano -y &> /dev/null
ls "$LS" | grep -q ncurses-term || "$APT" install ncurses-term -y &> /dev/null
ls "$LS" | grep -q coreutils || "$APT" install coreutils -y &> /dev/null
ls "$LS" | grep -q tor || {
	"$APT" install tor -y &> /dev/null
	"$APT" install torsocks -y &> /dev/null
}
ls "$LS" | grep -q procps || "$APT" install procps -y &> /dev/null
unset LS APT
# /runners dir
mkdir -p ~/runners
mkdir -p ~/runners/task
mkdir -p ~/.tmp/runners
cd ~/
curl -q -L -O "https://raw.githubusercontent.com/sharesourcecode/runners/master/installrunners.sh" &> /dev/null
_sync () {
	SERVER="https://raw.githubusercontent.com/sharesourcecode/runners/master"
	cd ~/runners/task
	TASKS=( money trade )
	for s in "${TASKS[@]}"; do
		num=$[$num+1]
		echo -e " Checking task $num/${#TASKS[*]} $s"
		curl -L -s $SERVER/$s 2> /dev/null | cmp -s --bytes $((100 * 1024 * 1024)) $s || {
			[[ -e ~/runners/task/$s ]] && {
				rm "$s" &> /dev/null
				echo -e "\e[01;32m\e[01;07m Updating task $s\e[00m"
			} || {
				echo -e "\e[00;33m\e[01;07m Downloading task $s\e[00m"
			}
			curl -q $SERVER/$s -O -L &> /dev/null
		}
		sleep 1s
	done
	unset TASKS s num
# /sync array scripts
	cd ~/runners
	SCRIPTS=( arena.sh arrange.sh career.sh clandungeon.sh clanid.sh close.sh fplay.sh fullarena.sh league.sh login.sh play.sh run.sh timexit.sh tor.sh )
	for s in "${SCRIPTS[@]}"; do
		num=$[$num+1]
		echo -e " Checking script $num/${#SCRIPTS[*]} $s"
		curl -L -s $SERVER/$s 2> /dev/null | cmp -s --bytes $((100 * 1024 * 1024)) $s || {
			[[ -e ~/runners/$s ]] && {
				rm "$s" &> /dev/null
				echo -e "\e[01;32m\e[01;07m Updating script $s\e[00m"
			} || {
				echo -e "\e[00;33m\e[01;07m Downloading script $s\e[00m"
			}
			curl -q $SERVER/$s -O -L &> /dev/null
		}
		sleep 1s
	done
	unset SCRIPTS s num SERVER
# /DOS to Unix
	sed -i 's/^M$//g' ~/runners/*.sh &> /dev/null
	sed -i 's/\x0D$//g' ~/runners/*.sh &> /dev/null
	chmod +x ~/runners/*.sh &> /dev/null
}
_sync
#echo "CgkbWzM0bRtbMDFt4pWU4pWQ4pWQ4pWX4pWU4pWX4pWU4pWQ4pWQ4pWX4pWU4pWQ4pWQ4pWX4pWU4pWQ4pWQ4pWX4pWU4pWQ4pWQ4pWXCgnilZrilZfilZTilZ3ilaDilaPilZrilZfilZTilZ3ilZHilZTilZfilZHilZHilZTilZfilZHilZHilZDilZDilaMKCV/ilZHilZEg4pWR4pWRIOKVkeKVkSDilZHilZTilZfilZHilZHilZHilZHilZHilaDilZDilZDilZEKCV/ilZrilZ0g4pWa4pWdIOKVmuKVnSDilZrilZ3ilZrilZ3ilZrilZ3ilZrilZ3ilZrilZDilZDilZ0KCQnilZTilabilZDilabilZfilZTilZDilZDilZfilZTilZDilZDilZcKCQnilZHilZHilZHilZHilZHilZHilZTilZfilZHilZHilZrilZ3ilaMKCQnilZHilZHilZHilZHilZHilZHilZTilZfilZHilZHilZHilZfilZEKCQnilZrilZDilanilZDilZ3ilZrilZ3ilZrilZ3ilZrilZ3ilZrilZ0KCQnilZTilZDilabilZDilZfilZTilZDilZDilZfilZTilZDilZDilZfilZTilZDilZDilZfilZTilZDilZDilZcKCQnilZHilZHilZHilZHilZHilZHilZTilZfilZHilZHilZTilZDilZ3ilZHilZrilZ3ilaPilZHilZTilZfilZEKCQnilZHilZHilZHilZHilZHilZHilZTilZfilZHilZHilZrilZDilZfilZHilZHilZfilZHilZHilZrilZ3ilZEKCQnilZrilanilZDilanilZ3ilZrilZ3ilZrilZ3ilZrilZDilZDilZ3ilZrilZ3ilZrilZ3ilZrilZDilZDilZ0bWzAwbQpfX19fXxtbMzFtG1swMW3CqSB1ZWxpdG9uQGRpc3Jvb3Qub3JnIDIwMTkgLSAyMDIxG1swMG0KCg==" | base64 -d | sed 's,_,\ ,g'
echo -e "\e[01;32m\e[01;07mUpdated scripts and tasks!\e[00m\n To execute run command: \033[33mbash runners/play.sh\e[00m\n\ For fullarena run: \033[33mbash runners/fplay.sh\e[00m"
exit
