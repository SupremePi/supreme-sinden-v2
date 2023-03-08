#!/bin/bash
#Supreme Team
#BETA INSTALL
  
if [ -d /home/pi/Lightgun ]; then
dialog --infobox "It looks like the Sinden lightgun is already installed!" 4 45 ; sleep 3

else

cd /home/pi/
git clone https://github.com/SupremePi/supreme-sinden-v2.git Lightgun
sudo chmod -R 777 $HOME/Lightgun
sudo chown -R pi:pi $HOME/Lightgun 
if [ -f $HOME/tamoplus/scripts/sinden-menu.sh ]; then
sudo rm $HOME/tamoplus/scripts/sinden-menu.sh
cp /home/pi/Lightgun/sinden-menu.sh $HOME/tamoplus/scripts/
fi

sudo apt install -y mono-complete
sudo apt install -y v4l-utils
sudo apt install -y libsdl1.2-dev
sudo apt install -y libsdl-image1.2-dev
sudo apt install -y libjpeg-dev

cd /home/pi/Lightgun
wget --output-document=SindenLightgun.png https://static.miraheze.org/sindenlightgunwiki/thumb/b/bb/SINDEN_ICON_TRANSPARENCY_LUMINAR_BLACK.png/1200px-SINDEN_ICON_TRANSPARENCY_LUMINAR_BLACK.png
cp /home/pi/Lightgun/SindenLightgun.png /home/pi/RetroPie/retropiemenu/icons/
cp -v Borders/RetroArchBorders/* /opt/retropie/emulators/retroarch/overlays/
#Check if on Supreme ultra
if [ -d /home/pi/RetroPie/retropiemenu/controllertools ]; then

#Check if on Supreme ultra v1
if [ -d /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/icons ]; then
cp /home/pi/Lightgun/SindenLightgun.png /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/icons/
fi

#Check if on Supreme ultra v2
if [ -d /home/pi/.supreme_toolkit/sb_toolkit/retropiemenu/icons/ ]; then
cp /home/pi/Lightgun/SindenLightgun.png /home/pi/.supreme_toolkit/sb_toolkit/retropiemenu/icons/
fi

cp /home/pi/Lightgun/sinden-menu.sh /home/pi/RetroPie/retropiemenu/controllertools
sudo chmod +x /home/pi/RetroPie/retropiemenu/controllertools/sinden-menu.sh

#Check if on Supreme ultra v1
if [ -d /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/icons ]; then
sudo cp /home/pi/RetroPie/retropiemenu/controllertools/sinden-menu.sh /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/controllertools/
fi

#Check if on Supreme ultra v2
if [ -d /home/pi/.supreme_toolkit/sb_toolkit/retropiemenu/icons/ ]; then
sudo cp /home/pi/RetroPie/retropiemenu/controllertools/sinden-menu.sh /home/pi/.supreme_toolkit/sb_toolkit/retropiemenu/controllertools/
fi

cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml.bkp
cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /tmp

cat /tmp/gamelist.xml |grep -v "</gameList>" > /tmp/templist.xml

ifexist=`cat /tmp/templist.xml |grep sinden |wc -l`
if [[ ${ifexist} > 0 ]]; then
  echo "already in gamelist.xml" > /tmp/exists
else
  echo "	<game>" >> /tmp/templist.xml
  echo "		<path>./controllertools/sinden-menu.sh</path>" >> /tmp/templist.xml
  echo "		<name>Sinden Lightgun Menu</name>" >> /tmp/templist.xml
  echo "		<desc>All one menu for the sinden.</desc>" >> /tmp/templist.xml
  echo "		<image>/home/pi/RetroPie/retropiemenu/icons/SindenLightgun.png</image>" >> /tmp/templist.xml
  echo "		<playcount>1</playcount>" >> /tmp/templist.xml
  echo "		<lastplayed></lastplayed>" >> /tmp/templist.xml
  echo "	</game>" >> /tmp/templist.xml
  echo "</gameList>" >> /tmp/templist.xml
  cp /tmp/templist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/scripts/.sb-unified/retropiemenu/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/scripts/.sb-unified/retropie-gml/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/retropiemenu/gamelist.xml
fi 
  
else

cp /home/pi/Lightgun/sinden-menu.sh /home/pi/RetroPie/retropiemenu/
sudo chmod +x /home/pi/RetroPie/retropiemenu/sinden-menu.sh

cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml.bkp
cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /tmp

cat /tmp/gamelist.xml |grep -v "</gameList>" > /tmp/templist.xml

ifexist=`cat /tmp/templist.xml |grep sinden |wc -l`
if [[ ${ifexist} > 0 ]]; then
  echo "already in gamelist.xml" > /tmp/exists
else
  echo "	<game>" >> /tmp/templist.xml
  echo "		<path>./sinden-menu.sh</path>" >> /tmp/templist.xml
  echo "		<name>Sinden Lightgun Menu</name>" >> /tmp/templist.xml
  echo "		<desc>All one menu for the sinden.</desc>" >> /tmp/templist.xml
  echo "		<image>/home/pi/RetroPie/retropiemenu/icons/SindenLightgun.png</image>" >> /tmp/templist.xml
  echo "		<playcount>1</playcount>" >> /tmp/templist.xml
  echo "		<lastplayed></lastplayed>" >> /tmp/templist.xml
  echo "	</game>" >> /tmp/templist.xml
  echo "</gameList>" >> /tmp/templist.xml
  cp /tmp/templist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
  cp /tmp/templist.xml /home/pi/RetroPie/retropiemenu/gamelist.xml  
fi
fi
fi

if [ -f /opt/retropie/emulators/retroarch/bin-org/retroarch-cg2glsl ]; then
dialog --infobox "Sinden retroarch patch already installed!" 4 45 ; sleep 3    
else
dialog --infobox "Now making a back up of your retroarch files." 4 45 ; sleep 3 
sudo mkdir /opt/retropie/emulators/retroarch/bin-org >/dev/null 2>&1
sudo cp /opt/retropie/emulators/retroarch/bin/retroarch /opt/retropie/emulators/retroarch/bin-org/
sudo cp /opt/retropie/emulators/retroarch/bin/retroarch-cg2glsl /opt/retropie/emulators/retroarch/bin-org/
if [ -f /opt/retropie/emulators/retroarch/bin-org/retroarch-cg2glsl ]; then
echo Now adding patched sinden retroarch files.
sudo cp /home/pi/Lightgun/RetroArchPatch/retroarch /opt/retropie/emulators/retroarch/bin/
sudo cp /home/pi/Lightgun/RetroArchPatch/retroarch-cg2glsl /opt/retropie/emulators/retroarch/bin/
sudo chmod +x /opt/retropie/emulators/retroarch/bin/*
dialog --infobox "Sinden retroarch patch now installed!" 4 45 ; sleep 3
fi
fi

dialog --infobox "Sinden Lightgun now installed." 3 45 ; sleep 3

