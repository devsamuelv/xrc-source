xRC Sim - V6.4b
-------------------------------

Thank you for trying xRC Simulator!

If you find any bugs, or have feature suggestions (or just want to say thank you), please go to:
	http://xRCSimulator.org/allforums

Known Bugs:

1) If you run the server and client on the same machine and leave the IP field empty or set it to 127.0.0.1, than issues will arise once the client disconnects from the server. Specifically, it will cause the server to lose the network conection and all other players will lose connection as well.

Workaround: use your external IP adress instead (e.g. go to whatismyip.com and try using that one).


Command Line options:
	-vrmode none  // Turns off VR
	-batchmode    // runs headless. Will use Graphics card in windows if able for physics simulation
	-nographics   // In windows, disables use of graphics card even for physics simulation

The following are command-line options that will be read in if running in batchmode (case insensitive):
	GAME=#  // Starts the game specified:
    		0="Splish Splash"
		1="Relic Recovery"
		2="Rover Ruckus"
		3="Skystone"
		4="Infinite Recharge"
		5="Change Up"
		6="Bot Royale"
		7="Ultimate Goal"
		8="Tipping Point"
		9="Freight Frenzy"
		
	FRAMERATE=## 		// Sets the frame-rate for the server: 1 to 120. 
				// Recommend setting it to ~60
	TMODE=ON/OFF  		// Turn on/off tournament mode
	STARTWHENREADY=ON/OFF   // Enables/Disbales option to start tournament mode when all users specify they are ready.
	HOLDINGMODE=ON/OFF  	// Turn on/off holding mode when people are waiting for game to start.
	GAMEOPTION=#  		// Sets the game option, from 1 to 5. Not every game uses this options setting.
	PASSWORD=XXXXX 		// Set the password to XXXX. Put in quotation mark (e.g. "XX XX") if space is part of password. No '=' allowed.
	SPECTATORS=# 		// Maximum number of spectators to allow. Spectators use up bandwidth so limitting ensured smoother gameplay.
	PORT=####		// The local machine port to open
	ROUTERPORT=#### 	// Set the router (or firewall) port #. This is the port that other users will try to connect to and needs to
				// be forwarded to your local port.
				// If firewall isn't used (e.g. direct connection as when running server in the cloud), set to the same value as PORT.
	REGISTER=ON/OFF 	// If set to On, will register server for others to find
	COMMENT="Comment..." 	// Set the server comment/description
	UPDATETIME=## 		// Sets the client update time in ms. The server's network update frame-rate is the inverse of this (e.g. 1/UPDATETIME).
				// 33 = 30 Frames/s, 25 = 40 Frames/s. Lower is better/smoother, but if set too low it will flood the network causing
				// buffer over-runs resulting in choppy/jittery performance. The more data sent, the higher this needs to be to avoid
				// issues. Highest data sent is when the most objects are moving - usually near end-game. I would avoid setting it below
				// 25 unless you know what you're doing.
	MAXDATA=#### 		// Sets the maximum bytes to send in any instance before cooling off. This helps spread data out and minimized packet-loss.
				// When set too low, will cause cool-off period to slow down frame-rate. When set too high, can result in packet-loss and jittery
				// performance. Recommend 3000 to be safe, 6000 on good network connections, even higher.
	ADMIN=<user> 		// Sets the admin user name. Admin user name is never displayed when sending chats, allowing this field to be in-itself a password (as long as
				// you only log in as a spectator).
	NETSTATS=ON/OFF		// Output outgoing packet statistics every minute. Mainly useful for helping debug high bandwidth utilization
	OUTPUT_SCORE_FILES=<DIR PATH>
				// Turns on output files containing current score states to specified directory
	GAMESETTINGS="x:x:x:..."  // Game specific option string. You can infer this string from the "Clean" code results in single-player mode (it's the part that looks like "1:0: ... "

		

Example:
	"xRC Simulator v5.8.exe" -batchmode -nographics -game=4 port=11115 routerport=11115 register=on admin=GF11115


In-Game Chat options (press ~ to begin chat):

Multi-Player And Server:
	/SET OUTPUT_SCORE_FILES
	/SET OUTPUT_SCORE_FILES=C:\temp\xRCsim
		Turns on output files containing current score states. Default path = \temp\xRCsim if none entered.

Multi-Player:
	/SET TURN_OFF_HUD
		Turns off all overlays. Press ~ to re-enable.
	/SET FIREWORKS_RED
	/SET FIREWORKS_BLUE
		Plays the fireworks animation (only on this client).
	/SET SHOW_VS
		Shows the "VS" screen. Screen appears instantly - no animation (only on this client).
	/SET HIDES_VS
		Hides the "VS" screen. Screen hides instantly - no animation (only on this client).
	/SET HIDE_CHAMPS
		Turns off the championship field (stadium, lights, etc...)
		
Server:
	/SET PASSWORD=NEW_PASSWORD
		Changes server password to NEW_PASSWORD.
	/SET TOURNAMENT
		Forces the start of tournament game (even if server wasn't enabled in tournament mode).
	
Admin:
	/SERVER RESTART
		Starts/Restarts the game. First the "vs" window will be shown for 4s followed by the 3s countdown.
	/SERVER STOP
		Stops current game.
	/SERVER KICKALL
		Kick all users (except for Admin)
	/SERVER KICK=<player name>
		Kick specified player
	/SERVER KICKID=<#>
		Kick player with id=<#>. This is a unique integer identifier each player is given internally
	/SERVER PASSWORD=<NEW PASSWORD>
		Changes server password
	/SERVER BLUEADJ=<##>
	/SERVER REDADJ=<##>
		Adds the number to the score. Can be a negative number.
		Number is the total adjustment (not incremental).
	/SERVER <CommandLineOption>
		All command line options will also be processed. Some (like changing port) will have no effect since network is already established.


OBJ Control
	If you enable OUTPUT_SCORE_FILES, then you can have OBJ send commands back to xRCSim by putting them into "execute.txt" in the output score file directory.
	Included is the script "xRCSimCommand.lua". This script allows you to associate commands that will be sent to xRCSim when the desired scenes are activated.

	Step 1) Load the scipt in OBS (under Tools->Scripts)

	In the Scripts Option window:
	Step 2) Specify the file to output the commands to (e.g. \tmp\xRCSim\execute.txt )
	Step 3) For each scene listed, enable the toggle to execute your command, and enter what command you would like to execute.
		(e.g. /SERVER RESTART)

	Several useful examples:
	Example1: /SET SHOW_VS \n/SERVER RESTART
	  Turns on the "vs" window without animation on the OBS client, and starts the server countdown sequence for all clients. 

	Example2: /SET SHOW_VS
	  Shows the "vs" screen on the OBS client. It will stay here indefinetaly.

	Example3: /SET HIDE_VS
	  Hides the "vs" screen on the OBS client.

		
