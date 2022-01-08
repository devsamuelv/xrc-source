chmod +x ./runserver.sh
chmod +x './xRC Simulator.x86_64'
'./xRC Simulator.x86_64' \
	-batchmode -nographics \
	RouterPort=$PORT \
	Port=$PORT \
	game=$GAME \
	FrameRate=$MAX_FRAME \
	tmode=On \
	register=On \
	Spectators=$SPECTATORS \
	updatetime=$UPDATE_TIME \
	maxdata=$MAX_DATA \
	startwhenready=On \
	comment=$COMMENT \
	admin=IAmAdmin \



