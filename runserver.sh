chmod +x ./runserver.sh
chmod +x './xRC Simulator v6.3.x86_64'
nohup './xRC Simulator v6.3.x86_64' \
	-batchmode -nographics \
	RouterPort=11115 \
	Port=11115 \
	game=5 \
	FrameRate=60 \
	tmode=On \
	register=On \
	Spectators=2 \
	updatetime=30 \
	maxdata=6000 \
	startwhenready=On \
	comment="My Test Server 1" \
	admin=IAmAdmin \
	> log.txt &



