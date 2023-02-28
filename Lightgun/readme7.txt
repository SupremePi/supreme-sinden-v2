Bare Bones Raspberry Pi Image Version 7

This image contains:

RetroPie V4.7.1 (RPI 4/400)
Sinden  V1.06
Mame2016 Hacked by AS (with config files)
Genisis Plus GX Hacked by AS
Retroarch Patch By AS

GUNS NEED TO BE RUNNING THE LATEST FIRMWARE


you will need to expand the file system:

from the command prompt 

"sudo raspi-config"

from the command line. Once in this, advanced options> expand file system

Nes, Snes, PS1, Genisis, Mastersystem, Dreamcast and Mame2016 are setup ready to go and shouldn't require any more configuration.

Just place roms and bios' in to their folders and they should work out of the box!




Hello Lightgun/pi enthusiasts.



As I’m writing this in the spring of 2021 lockdown looks like it’s coming to an end here in the UK and I’ve had to return to my day job full time. This will inevitably slow down any work on the image going forward. However I’m not giving up on it and there will be more improvements to come.


As always I’m contactable on the Sinden Discord Server


New Sinden Drivers:

Be aware that this version of the bare bones image uses v1.06 of the Sinden software. This software is still in beta – As I understand most of changes are in order to make the gun compatible with OG PlayStation hardware but there are also some bug fixes. 

Make sur you have the latest firmware on your guns

See the Sinden website for more details.

Tidied the ports menu

New Supported System:

3DO is now set up and running via the opera emulator.  Audio is a bit crap but could probably be tweeked

Bug Fixes:

Mouse indexes on psx emulator have been set to ‘0’ for player one and ‘2’ for player two. This looks like the most common working setup but be aware if you have other devices plugged into the pi these might change.

Player 2 controls have been remapped in flycast. This has been done to solve the problem of the start and select buttons for being mapped to the same keystroke for both players. Please note that to use the new mapping you have to start the ‘arcade’ script for player 2 in the ports menu.


















Changes in version 6:


	Bug where it wouldn't save configs - solved

	New drivers and Andy's new one shot calibration - installed

	Retroarch bug with cursor off to the left - patched out

	Arcade mode added to p2 in ports menu

	Recoil Options added to ports menu

	



Changes in version 5:
	

	'B' Button set on dreamcast
	most emulators are set to the correct aspect ratio
	All borders are set to 100% opacity
	EmulationStation Control configs have been reset
	SSH access is enabled hostname: retropie (no need to find IP)
	Crosshairs turned off in all emulators except NES and individual mame roms
	

	Error messages regarding missing game list have been corrected
	
	The following Atomiswave/naomi roms have been preconfigured

		Sports Shooting USA
		Ranger Mission
		Maze of Kings

	Image includes theme browser for emulationstation
	Version number on splashscreen
	Special Titch splashscreen



*******
Changes in version 4:

	Some emulators have been removed to free up space

	Retropie menu is back to normal
	Menu can be navigated with gun controls
	
	 The following mame2016 roms are pre configured:

alien3.zip
area51.zip
bang.zip
borntofi.zip
catch22.zip
cheyenne.zip
chiller.zip
claypign.zip
cracksht.zip
crossbow.zip
deerhunte.zip
desertgu.zip
dragngun.zip
duckhunt.zip
eggventrd.zip
gdfs.zip
ghlpanic.zip
ghoshunt.zip
gollygho.zip
gunbustr.zip
hogalley.zip
jpark.zip
le2.zip
lethalen.zip
lethalj.zip
lghostj.zip
loffire.zip
lordgun.zip
nycaptor.zip
oneshot.zip
opwolf.zip
opwolf3.zip
othunder.zip
rchase.zip
revx.zip
sgunner.zip
sgunner2.zip
shtngmste.zip
spacegun.zip
term2.zip
tickee.zip
trophyh.zip
turkhunt.zip
tutstomb.zip
undrfire.zip
vsfdf.zip
vsgshoe.zip
whodunit.zip
wschamp.zip
zeropnt.zip
zeropnt2.zip
zombraid.zip



Changes in version 3

	Auto detect monitor resolution has been switched off
	Resloution has been set to 1080p

	Support and Configuration has been added for

	Saga MegaDrive/Genisis
	Saga Master System
	Saga DreamCast

	More buttons have been mapped for superscope on the snes

	Emulators set to 4:3 resolution
