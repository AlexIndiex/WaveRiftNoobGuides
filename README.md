# DeckNoobGuides

A collection of guides, that go from recommended hardware to emulation.

> [!IMPORTANT]
> Friendly reminder of 17 U.S.C. 1201f, this section makes any copyright material's backup and emulator legal.



## Hardware recomendations


- Accessory you could need:
	- screen protector (self explanatory)
	- cover or skin (self explanatory)
	- travel bag (self explanatory)

- Extra hardware you could need:
	- microsd (samsung, sandisk, teamgroup)
	- 2230 nvme ssd for storage upgrade (corsair, sabrent, westerdigital)
	- dock, usb-c hub or adaptor (official or any other 3rd party products that isnt borderline scammy)
	- mice and keyboard (logitech and akko)
	- monitor (whatever you already have, 1080p60hz recommended for deck only)
	- 45w to 65w powerbank (20000mah capacity highly suggested) 
	- external storage (in case something happens with the microsd, sharge disk recommended or a normal sata to usb enclosure)
	- earbuds (moondrop brand highly suggested)
	- headphones (your choice)

- Extra programs you could like to have:
	- protonup-qt (useful for compatibility layers other than valve's proton)
	- decky loader (for plugin in gaming mode)
	- emudeck (wrapper to install everything you need for emulation)
	- discord (self explanatory)
	- google chrome (self explanatory)
	- lutris (to install non-steam games from other sources)
	- heroic launcher (to install epic games and gog galaxy games)
	- prism launcher (to install minecraft java)
	- libreoffice (microsoft office alternative for linux)
	- onlyoffice (microsoft office alternative for linux)
	- vlc media player (media player for audio and video files)
	- obs (recording and streaming program)
	- kdenlive (adobe premiere alternative for linux)
	- krita (adobe photoshop alternative for linux)
	- gimp (adobe photoshop alternative for linux)
	- bottles (similar to lutris but only for simple exe programs that dont need much dependencies)
	- flatseal (flatpaks' permissions manager)
	- protontricks (side loader for dependencies needed for certain games)
	- deckthemes (css loader of decky but for desktop steam)



## OLD EmuDeck Setup Guide


- Files and programs you need:
	- [EmuDeck](<https://www.emudeck.com/#download>)
	- Bios files (needed for PS1, PS2, Nintendo Switch, Nintendo DS/DSi, Sega CD, Saturn and DreamCast emulation)
	- Roms files (for the systems you want to emulate)
	- Free storage (either on your internal storage, microSD or external storage)
	- An internet connection (kinda obvious)

- Other things you might need:
	- Dock or hub (for multiple devices connection)
	- Mouse and keyboard (useful for navigation)
	- External drive (either for moving files or using it for EmuDeck)
	- [Synchthing](<https://www.youtube.com/watch?v=nzix6-uKTA0>) (if you care for synching files between different PCs)
	- [Warpinator](<https://www.youtube.com/watch?v=sHdQT6kI6Q8>) and [Winpinator](<https://github.com/swiszczoo/winpinator>) (if you dont have an external drive to move your files)
	- Mods and cheats (you either rely on communities or other sites)
	- [EmuDeckWiki](<https://emudeck.github.io/>) for any other kind of help or reference
	- [Compatibility list](<https://brantje.github.io/emudeck-compatibility-list/>) from EmuDeck's users
	- [EmuDeck's Discord server](<https://discord.gg/b9F7GpXtFP>) for any other help
	- [DeckyLoader](<https://github.com/SteamDeckHomebrew/decky-loader>) for PowerTools (it can be installed with EmuDeck)

Now lets get started with the installation process:
- Initial EmuDeck installation:
	- In DesktopMode, download [EmuDeck.desktop](<https://www.emudeck.com/#download>) and move it to your desktop window
	- Double click it, its gonna start installing EmuDeck (and only EmuDeck), you gonna notice from the previous file being replaced with a new one with the EmuDeck logo, once it finishes its going to open the program for you
	- Select either quick or custom installation, the difference between the two is the ability to choose what emulators you want to install, the first one install everything EmuDeck offers support for, while with the second you can just install what emulators you care for
	- Select where you want to install your emulation folder, (the emulators you want if you chose custom installation on the starting screen), (the emulators you want to get updated if you chose custom installation on the starting screen), the aspect ratio for your emulators (i would recommend using the original aspect ratio of each system so you wont encounter graphical glitches), the EmulationStation's theme, whatever you want homebrew games or not, now click the finish button and let EmuDeck install everything you chosen
	- After the installation its done, click done, now dont bother with the add games section, its gonna prompt again the installation process for the device where you have your files and its gonna ask you to move your files in the correct folders, which you can do on your own without redoing everything again, so skip it, now close EmuDeck

Its time to move your files: 
- [DISCLAIMER] In this section i will tell you where to move your files with an external drive since its the fastest way to do it, if want to do it in any other way, please refer to the embed links in [Synchthing](<https://www.youtube.com/watch?v=nzix6-uKTA0>), [Warpinator](<https://www.youtube.com/watch?v=sHdQT6kI6Q8>) and [Winpinator](<https://github.com/swiszczoo/winpinator>):
 	- Open Dolphin, the file explorer, not the emulator, and navigate to your drive where you installed EmuDeck, you gonna find a folder named Emulation, right click on it and open it in a new tab, while you are in it open a new tab for both bios and roms folders, now return to the first tab and open the drive where you have the files you want to move, now you should have 4 tabs, the drive of your files, the emulation folder, bios folder and roms folder, you can close the emulation folder if you dont have any kind of save file or texture pack to move
   	- You can start moving your bios files from your drive to the bios folder, the only files that need a deeper location is your Nintendo Switch's keys and firmware files, that you can move in both Yuzu and Ryujinx folder (Ryujinx needs the firmware installed instead), (for any other emulator please refer to the [EmuDeckWiki](<https://emudeck.github.io/>))
	- You can start moving your roms from your drive to the roms folder, inside of it you going to find out that each system has a folder for its roms, you can read a text file inside each of them to know what roms' format each emulator supports, i would recommend creating an update folder for modern systems (like 3DS, WiiU, Switch, PS3, Xbox360, Xbox) that support update roms for your games in /Emulation/roms/ (please pay attention to folder like WiiU, you gonna find another rom folder inside of it, you need to move your roms there instead of just /Emulation/roms/wiiu/)

You can now open again EmuDeck and start installing extra programs you might need to get everything working in the best way:
- [DISCLAIMER] Please install [DeckyLoader](<https://github.com/SteamDeckHomebrew/decky-loader>) to use PowerTools and DeckyControls
	- Lets start by checking your bios files, select the bios checker section and make sure the box for the emulators you need a bios for is green, if it's not make sure it isnt corrupted or damaged by redumping it again
	- If you want to use the gyro controls for emulators that need it or support it, open the gyroscope section, you gonna need a sudo password, if you have not set a password, this page will prompt you to create one, insert it and click install, once the terminal closes, you can go back to the main page
	- Next, you gonna need PowerTools for emulators like Yuzu and Dolphion-emu, mainly to disable smt, the multi-thread process of Deck's APU, since in SteamOS 3.4 it's bugged, go to the PowerTools section and install it the same way as the gyroscope section (same process for DeckyControls, a plugin to quickly check each emulator controls and hotkeys)
	- For better WiiU emulation i would recommend installing Cemu native, known as Cemu appimage, you can get it in manage emulators>cemu>install cemu appimage
	- Add your emulators and roms to Steam with SteamRomManager so you will be able to play them in GamingMode, there is a shortcut in the initial page of EmuDeck, click it, it's going to prompt that it's closing Steam for you, if your controls dont work after clicking yes please use a mouse to navigate your Deck for this process, wait for SteamRomManager to boot, once it opens go to settings>theme>change it from emudeck to classic for easier navigation, you can either leave everything on or turn off the toggle parsers' toggle and turn on only the toggles for the systems you want to add to Steam, once you down choosing, click preview>parse, wait for the programs to retrieve the urls for the artworks, once its done, click save to steam, now click on the log tab and wait for SteamRomManager to finish saving everything to Steam, once its done, close it, and open Steam.
	- You can now either go back to GamingMode, installing your roms updates for your emulators, or fixing Dolphin-emu and Yuzu gyro controls, for this last point please refer to the following links:
		- https://emudeck.github.io/emudeck-application/steamos/emudeck-application-101/#steamdeckgyrodsu
		- https://github.com/kmicki/SteamDeckGyroDSU/issues/45#issuecomment-1518530487
		- https://emudeck.github.io/emulators/steamos/dolphin/#dolphin-tips-and-tricks



## 45fps BOTW on Cemu


- Step 1: Install emudeck and cemu with it, the appimage is advised due to be compatible in gaming mode

- Step 2: put your roms into the emudeck folder inside `/Emulation/roms/wiiu/roms`, you need base game and latest update

- Step 3: Open Cemu, select `File>Install game title, update or dlc` and select the update and/or dlc file in the previous said path, the update should be called `The Legend of Zelda Breath of the Wild (UPDATE DATA) (vXXX)`and dlc `The Legend of Zelda Breath of the Wild (DLC)`

- Step 4: In Cemu topbar select `Options>Graphics Packs`, in this windows click on `download latest community graphic packs`, if cemu find a new version install it and wait to be installed, then open again the Graphic Packs

- Step 5: In the graphics pack windows select `The Legend of Zelda Breath of the Wild` and open all the drop down menus expect the cheats if you dont need them

- Step 6: in `Mods` enable `extended memory`, then in `fps++`, click on it and select `mode>advanced settings` set the `frame rate limit` to 40fps, `cutscene fps limit` to `limit all cutscenes to 30fps`, `static mode` to `disabled`, `frame average` to `6 frames averaged`, `fence type` to `performance fence`, now enable `fps++`

- Step 7: in `Workarounds` enable `grass swaying`, then in `Enhancements`, click on it and set `reflection range` to `disabled`, then `anisotropic filtering` to `medium`, now enable `Enhancements`, now in `Graphics` set the `anti-aliasing` to `none` , `shadows` to `low`, `shadow draw distance` to `medium` or `low`, your choice here, now enable as well `Graphics`

- Step 8: restart Cemu and enjoy Botw :]



## 30fps TOTK on YuzuEA


- requirements: keys and firmware 16.0.3 from your switch, totk and update 1.2.0 roms, emudeck and mods patches (optional: powertools if you have an oc deck or you are on os 3.4.X)

- Step 1: go into desktop mode, install yuzu with emudeck (if you want yuzu ea use the ninty foldder)

- Step 2: move the keys and firmware inside `/Emulation/bios/yuzu/`

- Step 3: move the roms into emudeck inside `/Emulation/roms/switch/`and install the update

- Step 4: open yuzu, go into `Emulation>Configure>Graphics` in `Graphics` change `vsync mode` to `fifo relaxed`, switch to the advanced tab and switch `ASTC recompression` to `BC3` , enable `Enable asynchronous presentation` and `Force maximum clocks`, everything else is stock

- Step 5: download the zip file attached to this message and extract the content into the mods directory, with yuzu right click on the game and select `open mod data location`

- Step 6: go back into gaming mode and make sure you set in the quick access menu :button_aux_1::button_aux_2: the gpu clock at 1200 and lock the fps limiter to 30, with some decks decreasing the tdp to 11/13 watts helps with battery life (with powertools disable smt only when you are using yuzu on os 3.4.X)

- Step 7: enjoy your totk experience on deck too :]

> [!TIP]
> NOTE: if you are updating the mods or is the first time you are using them, clean all your pipeline shaders from totk in the remove section of yuzu when you right click on the title.



## BETA Emulators autoinstall script


The `update.sh` script is to install and update `Dolphin Developer`, `Cemu`, `Panda3DS`, `mgbaDev`, `Ryujinx` and `RMG` from their github repository on Steam Deck:

- Go to desktop mode;
  
- Download the file attached to this message;
  
- Open Konsole terminal and type `chmod +x /home/deck/Downloads/updater.sh` to give the `.sh` file permission to execute on deck;
  
- Now open the `.sh` file, its gonna download the latest builds in `/home/deck/Applications/`, you gonna receive some pop-ups of what it got updated;
  
- Now go to `/home/deck/Applications/` and link in your desktop the emulators (for Ryujinx, just link `Ryujinx.sh` from `/home/deck/Applications/publish/`);
  
- Add the `.sh` file and the new appimages to Steam and enjoy the latest updates;

(Panda3DS is Alber_x86_64.Appimage)

> [!TIP]
> NOTE: **ONLY** `Cemu`, `mgbaDev` and `Ryujinx` work with `EmuDeck` and `SteamRomManager`, `Dolphin Developer` and `Panda3DS` **DO NOT**, so **CHANGE ANYTHING AT YOUR OWN RISK**;

> NOTE 2: once in a while clean the `Linux-Qt` 7z files and `Ryujinx` tar.gz files from `/home/deck/Applications/`, leave only the latest downloaded.
