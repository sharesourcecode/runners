_play () {
	_all () {
#		_cave
		_arena
#		_openChest
		_trade
		_money
#		_built
		sleep 5
	}
# /game time
	case $(date +%H:%M) in
#00:00:00
		(00:00) _all
			_crono ;;
#00:18:45
		(00:18) _all
			_crono ;;
#00:37:30
		(00:37) _all
			_crono ;;
#00:56:15
		(00:56) _all
			_crono ;;
#01:15:00
		(01:15) _all
			_crono ;;
#01:33:45
		(01:33) _all
			_crono ;;
#01:52:30
		(01:52) _all
			_crono ;;
#02:11:15
		(02:11) _all
			_crono ;;
#02:30:00
		(02:30) _all
			_crono ;;
#02:48:45
		(02:48) _all
			_crono ;;
#03:07:30
		(03:07) _all
			_crono ;;
#03:26:15
		(03:26) _all
			_crono ;;
#03:45:00
		(03:45) _all
			_crono ;;
#04:03:45
		(04:03) _all
			_crono ;;
#04:22:30
		(04:22) _all
			_crono ;;
#04:41:15
		(04:41) _all
			_crono ;;
#05:00:00
		(05:00) _all
			_crono ;;
#05:18:45
		(05:18) _all
			_crono ;;
#05:37:30
		(05:37) _all
			_crono ;;
#05:56:15
		(05:56) _all ;;
#06:15:00
		(06:15) _all
			_crono ;;
#06:33:45
		(06:33) _all
			_crono ;;
#06:52:30
		(06:52) _all
			_crono ;;
#07:11:15
		(07:11) _all
			_crono ;;
#07:30:00
		(07:30) _all
			_crono ;;
#07:48:45
		(07:48) _all
			_crono ;;
#08:07:30
		(08:07) _all
			_crono ;;
#08:26:15
		(08:26) _all
			_crono ;;
#08:45:00
		(08:45) _all
			_crono ;;
#09:03:45
		(09:03) _all
			_crono ;;
#09:22:30
		(09:22) _all
			_crono ;;
# /Clan dmg  09:30:00 - 21:30:00
		(09:2[8-9])
#			_clanmgfight
			_crono ;;
#09:41:15
		(09:41) _all
			_crono ;;
# /Valley of the Immortals 10:00:00 - 16:00:00 - 22:00:00
		(9:5[7-9])
			_undying
			_crono ;;
# /Battle of banners 10:15:00 - 16:15:00
		(10:1[3-4])
#			_flagfight
			_crono ;;
#10:18:45
		(10:18) _all
			_crono ;;
# /Clan coliseum 10:30:00 - 15:00:00
		(10:2[7-9])
			_clancoliseum
			_crono ;;
#10:37:30
		(10:37) _all
			_crono ;;
#10:56:15
		(10:56)	_crono ;;
# /Clan tournament 11:00:00 - 19:00:00
		(10:5[7-9])
			_clanfight
			_crono ;;
#11:15:00
		(11:15) _all
			_crono ;;
#11:33:45
		(11:33) _all
			_crono ;;
#11:52:30
		(11:52) _all
			_crono ;;
#12:11:15
		(12:11) _all
			_crono ;;
# /King of the Immortals 12:30:00 - 16:30:00 - 22:30:00
		(12:2[7-9])
			_king
			_crono ;;
#12:48:45
		(12:48) _all
			_crono ;;
#13:07:30
		(13:07) _all
			_crono ;;
#13:26:15
		(13:26) _all
			_crono ;;
#13:45:00
		(13:45) _all
			_crono ;;
# /Ancient Altars 14:00:00 - 21:00:00
		(13:5[7-9])
			_altars
			_crono ;;
#14:03:45
		(14:03) _all
			_crono ;;
#14:22:30
		(14:22) _all
			_crono ;;
#14:41:15
		(14:41) _all
			_crono ;;
# /Clan coliseum 10:30:00 - 15:00:00
		(14:5[7-9])
			_clancoliseum
			_crono ;;
#15:18:45
		(15:18) _all
			_crono ;;
#15:37:30
		(15:37) _all
			_crono ;;
#15:56:15
		(15:56)	_crono ;;
# /Valley of the Immortals 10:00:00 - 16:00:00 - 22:00:00
		(15:5[7-9])
			_undying
			_crono ;;
# /Battle of banners 10:15:00 - 16:15:00
		(16:1[3-4])
#			_flagfight
			_all
			_crono ;;
# /King of the Immortals 12:30:00 - 16:30:00 - 22:30:00
		(16:2[7-9])
			_king
			_all
			_crono ;;
#16:33:45
		(16:33) _all
			_crono ;;
#16:52:30
		(16:52) _all
			_crono ;;
#17:11:15
		(17:11) _all
			_crono ;;
#17:30:00
		(17:30)	_all
			_crono ;;
#17:48:45
		(17:48) _all
			_crono ;;
#18:07:30
		(18:07) _all
			_crono ;;
#18:26:15
		(18:26) _all
			_crono ;;
#18:45:00
		(18:45) _all
			_crono ;;
# /Clan tournament 11:00:00 - 19:00:00
		(18:5[7-9])
			_clanfight
			_crono ;;
#19:03:45
		(19:03) _all
			_crono ;;
#19:22:30
		(19:22) _all
			_crono ;;
#19:41:15
		(19:41) _all
			_crono ;;
#20:00:00
		(20:00) _all
			_crono ;;
#20:18:45
		(20:18) _all
			_crono ;;
#20:37:30
		(20:37) _all
			_crono ;;
#20:56:15
		(20:56) _crono ;;
# /Ancient Altars 14:00:00 - 21:00:00
		(20:5[7-9])
			_altars
			_crono ;;
#21:15:00
		(21:15) _all
			_crono ;;
# /Clan dmg  09:30:00 - 21:30:00
		(21:2[8-9])
#			_clanmgfight
			_crono ;;
#21:33:45
		(21:33) _all
			_crono ;;
#21:52:30
		(21:52) _crono ;;
# /Valley of the Immortals 10:00:00 - 16:00:00 - 22:00:00
		(21:5[7-9])
			_undying
			_crono ;;
#22:11:15
		(22:11) _all
			_crono ;;
# /King of the Immortals 12:30:00 - 16:30:00 - 22:30:00
		(22:2[7-9])
			_king
			_crono ;;
#22:48:45
		(22:48) _all
			_crono ;;
#23:07:30
		(23:07) _all
			_crono ;;
#23:26:15
		(23:26) _all
			_crono ;;
#23:45:00
		(23:45) _all
			_crono ;;
		(*)
			_sleep
			_crono ;;
	esac
}
