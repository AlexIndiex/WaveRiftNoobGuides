# WaveRift Noob Guides

A collection of guides, that range from an autoinstaller, recommended peripheral hardware, to emulation and more...

[Quick emulators backup link](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing)

## WaveRift: BETA Emulators autoinstall script for Linux users:

The `update.sh` is a script to install and update `Dolphin Developer`, `Cemu`, `Panda3DS`, `mgbaDev`, `melonDS`, `Ryujinx`, `RMG`, `Lime3DS`, `SkyEmu`, `citrapmk7`, `GearBoy`, `bsnes` and `snes9x` from their respective repositories.

<details>
	
  <summary>Some preliminary notes: ⮧</summary>
  
> NOTE 1: I recommend getting Emudeck installed, because the script relies on a folder in your user directory, which is `$HOME/Applications`.
>
> But don't worry, if you don't want to, the script makes it for you!
>
> NOTE 2: The `updater-v2.1.sh` file is the new version of the script.
> In the current state it could replace the previous version while providing notifications on what got updated, remained the same or even failed to download, at the cost of 6 times more pop-ups!
> 
> (these pop-ups are for troubleshooting reasons, you could disable what you dont need by simply modify `notify "text here"` to `echo "text here"` inside the script file);
> 
> Also this script uses another folder, which is `$HOME/Apps`, and the script will make this folder for you!
> 
> This change was made so if something goes wrong you don't have to reset your Emudeck's configuration!
>
> IMPORTANT: **ONLY** `Cemu`, `mgbaDev`, `Lime3DS`, `citrapmk7` and `Ryujinx` work with `EmuDeck` and `SteamRomManager`; `SkyEmu`, `Dolphin Developer`, `melonDS`, `Panda3DS`, `GearBoy`, `bsnes` and `snes9x` **DO NOT**, **CHANGE ANYTHING AT YOUR OWN RISK**.

</details>
	
To use the script, follow these steps:

* Download the `update.sh` file;
  
* Open Konsole terminal and type `chmod +x $HOME/Downloads/updater.sh` to give the `.sh` file permission to execute;
  
* Now open the `.sh` file, it's going to download the latest builds in `$HOME/Applications/` and notify you with pop-ups of what it got updated;
  
* Now go to `$HOME/Applications/` and link in your desktop the emulators (for `Ryujinx` link `Ryujinx.sh` from `$HOME/Applications/publish/`, for `Lime3DS` and `citrapmk7` link `.AppImage` from their respective `$HOME/Applications/` folders);
  
* Add the `.sh` file and the new linked emulators to Steam and enjoy the latest updates.

## EXTRA

I made some lists regarding emulators, pc ports and utilities this repository follows to make backups of, you can find them [here](https://github.com/AlexIndiex?direction=desc&sort=updated&tab=stars).

<details>
	
  <summary>Accessories and Hardware Recommendations for SteamDeck: ⮧</summary>

- Accessories you could need:
	- Screen protector (self-explanatory).
	- Cover or skin (self-explanatory).
	- Travel bag (self-explanatory).

- Extra hardware you could need:
	- MicroSD (Samsung, SanDisk, Team-Group).
	- 2230 NVMe SSD for storage upgrade (Corsair, Sabrent, Western Digital).
	- 45w to 65w PD power bank (20000mAh capacity highly suggested).
	- External storage in case something happens with the microSD (ShargeDisk or a normal SATA to USB enclosure).
	- [Monitor](https://youtu.be/Z8rJxJo3cfI) (LG, Alienware, Gigabyte).
	- Keyboard (Keychron, Akko/Epomaker, Wooting).
	- Mouse (Logitech, Pulsar, Endgame Gear).
	- IEMs (Moondrop, Tangzu, 7hz, Truthear).
	- Headphones (Sennheiser, AKG, Shure).
	- Portable DAC/AMP (Qudelix, Fiio, Moondrop).
	- Cables/hubs (Ugreen, Anker, StarTech).
	- Controllers (Flydigi, Gamesir, 8bitdo).

- Extra programs you could like to have:
	- WaveRift (shameless plug)
	- ProtonUp-QT (useful for compatibility layers other than Valve's Proton).
	- DeckyLoader (for plugins in gaming mode).
	- EmuDeck (wrapper to install everything you need for emulation).
	- Discord/Vencord (self-explanatory).
	- Vivaldi (better alternative to Chrome).
	- Lutris (to install non-Steam games from other launchers or sources).
	- Heroic Launcher (to install EpicGames and GOG Galaxy games).
	- Prism Launcher (to install Minecraft Java).
	- LibreOffice (Microsoft Office alternative).
	- OnlyOffice (Microsoft Office alternative).
	- VLC media player (media player for audio and video files).
	- OBS (recording and streaming program).
	- KdenLive (Adobe Premiere alternative).
	- Krita (Adobe Photoshop alternative).
	- Gimp (Adobe Photoshop alternative).
	- Bottles (similar to Lutris but only for simple exe programs that don't need many dependencies).
	- Flatseal (Flatpak's permissions manager).
	- ProtonTricks (side loader for dependencies needed for certain games).
	- DeckThemes (CSS Loader of DeckyLoader but for desktop Steam).

</details>

<details>
	
  <summary>EmuDeck Setup (prior Citrus death): ⮧</summary>

- Files and programs you need:
	- [EmuDeck](https://www.emudeck.com/#download).
	- [BIOS](https://drive.google.com/file/d/1XfR8c4riFvkdkrARhYJ5-ghPog-_ioUj/view?usp=drive_link) [files](https://emulation.gametechwiki.com/index.php/Emulator_files) (needed for PS1, PS2, Nintendo Switch, Nintendo DS/DSi, Sega CD, Saturn, and DreamCast emulation).
	- [ROM](https://r-roms.github.io/) [files](https://www.reddit.com/r/Piracy/wiki/megathread/emulators/) (for the systems you want to emulate).
	- Free storage (either on your internal storage, microSD, or external storage).
	- An internet connection (kinda obvious).

- Other things you might need:
	- Dock or hub (for multiple devices connection).
	- Mouse and keyboard (useful for navigation).
	- External drive (either for moving files or using it for EmuDeck).
	- [Syncthing](https://www.youtube.com/watch?v=nzix6-uKTA0) (if you care for syncing files between different PCs).
	- [Warpinator](https://www.youtube.com/watch?v=sHdQT6kI6Q8) and [Winpinator](https://github.com/swiszczoo/winpinator) (if you don't have an external drive to move your files).
	- [Mods](https://gamebanana.com/) and [Cheats](https://www.cheatslips.com/) (you either rely on communities or dedicated sites).
	- [DeckyLoader](https://github.com/SteamDeckHomebrew/decky-loader) for PowerTools (it can be installed with EmuDeck).

Now let's get started with the installation process:
- Initial EmuDeck installation:
	- In Desktop Mode, download [EmuDeck.desktop](https://www.emudeck.com/#download) and move it to your desktop window.
	- Double click it. It will start installing EmuDeck (and only EmuDeck). You'll notice the previous file being replaced with a new one with the EmuDeck logo. Once it finishes, it's going to open the program for you.
	- Select either quick or custom installation. The difference between the two is the ability to choose what [emulators](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing) you want to install. The first one installs everything EmuDeck offers support for, while with the second, you can just install the emulators you care for.
	- Select where you want to install your emulation folder (Which contains the aformentioned emulators based on the selection you made), the aspect ratio for your emulators (I would recommend using the original aspect ratio of each system so you won't encounter graphical glitches), the EmulationStation's theme and whether you want homebrew games or not. Now click the finish button and let EmuDeck install everything you chose.

It's time to move your files: 
- [DISCLAIMER] In this section, I will tell you where to move your files with an external drive since it's the fastest way to do it. If you want to do it in any other way, please refer to the embedded links in [Syncthing](https://www.youtube.com/watch?v=nzix6-uKTA0), [Warpinator](https://www.youtube.com/watch?v=sHdQT6kI6Q8), and [Winpinator](https://github.com/swiszczoo/winpinator):
 	- Open Dolphin, the file explorer (not the emulator), and navigate to your drive where you installed EmuDeck. You're gonna find a folder named Emulation. Right-click on it and open it in a new tab. While you are in it, open a new tab for both BIOS and ROMs folders. Now return to the first tab and open the drive where you have the files you want to move. Now you should have 4 tabs: the drive of your files, the emulation folder, BIOS folder, and ROMs folder. You can close the emulation folder if you don't have any kind of save file or texture pack to move.
   	- You can start moving your BIOS files from your drive to the BIOS folder. The only files that need a deeper location are your Nintendo Switch's keys and firmware files, which you can move to both Yuzu and Ryujinx folders (Ryujinx needs the firmware installed instead). (For any other emulator, please refer to the [EmuDeckWiki](https://emudeck.github.io/)).
	- You can start moving your ROMs from your drive to the ROMs folder. Inside of it, you're going to find out that each system has a folder for its ROMs. You can read a text file inside each of them to know what ROMs' format each emulator supports. I would recommend creating an update folder for modern systems (like 3DS, WiiU, Switch, PS3, Xbox360, Xbox) that support update ROMs for your games in /Emulation/ROMs/ (please pay attention to folders like WiiU; you're gonna find another ROM folder inside of it, and you need to move your ROMs there instead of just /Emulation/ROMs/WiiU/).

You can now open EmuDeck again and start installing extra programs you might need to get everything working in the best way:
- [DISCLAIMER] Please install [DeckyLoader](https://github.com/SteamDeckHomebrew/decky-loader) to have access to EmuDeck specific plugins.
	- Let's start by checking your BIOS files. Select the BIOS checker section and make sure the box for the emulators you need a BIOS for is green. If it's not, make sure to redumping it.
	- If you want to use the gyro controls for emulators that need it or support it, open the gyroscope section. You're gonna need a sudo password. If you have not set a password, this page will prompt you to create one. Insert it and click install. Once the terminal closes, you can go back to the main page.
	- Next, you're gonna need PowerTools for emulators like Yuzu and Dolphin-emu, mainly to disable SMT, the multi-thread process of Deck's APU, since in SteamOS 3.4 it's bugged. Go to the PowerTools section and install it the same way as the gyroscope section (same process for DeckyControls, a plugin to quickly check each emulator's controls and hotkeys).
	- For better WiiU emulation, I would recommend installing Cemu native, known as Cemu appimage. You can get it in manage emulators > Cemu > install Cemu appimage.
	- Add your emulators and ROMs to Steam with SteamRomManager so you will be able to play them in GamingMode. There is a shortcut on the initial page of EmuDeck. Click it. It's going to prompt that it's closing Steam for you. If your controls don't work after clicking yes, please use a mouse to navigate your Deck for this process. Wait for SteamRomManager to boot. Once it opens, go to settings > theme > change it from EmuDeck to classic for easier navigation. You can either leave everything on or turn off the toggle parsers' toggle and turn on only the toggles for the systems you want to add to Steam. Once you're done choosing, click preview > parse. Wait for the program to retrieve the URLs for the artworks. Once it's done, click save to Steam. Now click on the log tab and wait for SteamRomManager to finish saving everything to Steam. Once it's done, close it, and open Steam.
	- You can now either go back to GamingMode, installing your ROMs updates for your emulators, or fixing Dolphin-emu and Suyu/Yuzu gyro controls. For this last point, please refer to the following links:
		- https://emudeck.github.io/emudeck-application/steamos/emudeck-application-101/#steamdeckgyrodsu;
		- https://github.com/kmicki/SteamDeckGyroDSU/issues/45#issuecomment-1518530487;
		- https://emudeck.github.io/emulators/steamos/dolphin/#dolphin-tips-and-tricks.

> If you updated Emudeck and lost your Citrus entries after using SteamRomManager, the way it parsed [Yuzu](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing) is:
> 
> - For Windows: `"C:\Windows\System32\cmd.exe"" /k start /min "Loading PowerShell Launcher" "C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {C:\Emulation\tools\launchers\yuzu.ps1 '-f' '-g' 'C:\Emulation\roms\switch\[rom].nsp'}" && exit " && exit --emudeck` in target;
> 
> - For Linux: `"/home/deck/Emulation/tools/launchers/yuzu.sh"` in target, and `vblank_mode=0 %command% -f -g "'/home/deck/Emulation/roms/switch/[rom].nsp'"` in launch options;
> 
> meanwhile for [Citra](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing) is:
> 
> - For Windows: `"C:\Windows\System32\cmd.exe" /k start /min "Loading PowerShell Launcher" "C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {D:\Emulation\tools\launchers\citra.ps1 'D:\Emulation\roms\n3ds\[rom].cxi'}" && exit " && exit --emudeck` in target;
> 
> - For Linux: `"/usr/bin/flatpak" run org.citra_emu.citra "/home/deck/Emulation/roms/n3ds/[rom].cxi"` in target for [Citra flatpak](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing); `your citra-qt.appimage path here` in target, and `vblank_mode=0 %command% "'/home/deck/Emulation/roms/n3ds/[rom].cxi'"` in launch options for [Citra Appimage](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing)(similar to yuzu SRM for Linux);
>
> These values go into the properties when creating a new entry for a Non-Steam game/app.
> 
> If you need the middleware files used by SteamRomManager, you can find them in the Citrus folder inside the [retired emulators](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing).

</details>

<details>
	
  <summary>45fps BOTW on Cemu for SteamDeck: ⮧</summary>

- Step 1: Install EmuDeck and Cemu with it. The appimage is advised due to compatibility in gaming mode.

- Step 2: Put your ROMs into the EmuDeck folder inside `/Emulation/ROMs/WiiU/ROMs`. You need the base game and the latest update.

- Step 3: Open Cemu, select `File>Install game title, update or DLC` and select the update and/or DLC file in the previously said path. The update should be called `The Legend of Zelda Breath of the Wild (UPDATE DATA) (vXXX)` and DLC `The Legend of Zelda Breath of the Wild (DLC)`.

- Step 4: In Cemu top-bar select `Options>Graphics Packs`. In this window, click on `download latest community graphic packs`. If Cemu finds a new version, install it and wait for it to be installed. Then open the Graphic Packs again.

- Step 5: In the graphics pack window, select `The Legend of Zelda Breath of the Wild` and open all the drop-down menus except the cheats if you don't need them.

- Step 6: In `Mods`, enable `extended memory`. Then in `fps++`, click on it and select `mode>advanced settings`. Set the `frame rate limit` to 40fps, `cutscene fps limit` to `limit all cutscenes to 30fps`, `static mode` to `disabled`, `frame average` to `6 frames averaged`, `fence type` to `performance fence`. Now enable `fps++`.

- Step 7: In `Workarounds`, enable `grass swaying`. Then in `Enhancements`, click on it and set `reflection range` to `disabled`. Then `anisotropic filtering` to `medium`. Now enable `Enhancements`. Now in `Graphics` set the `anti-aliasing` to `none`, `shadows` to `low`, `shadow draw distance` to `medium` or `low`, your choice here. Now enable `Graphics`.

- Step 8: Restart Cemu and enjoy Botw :]

</details>

<details>
	
  <summary>30fps TOTK on YuzuEA for SteamDeck: ⮧</summary>

- Requirements: keys and firmware 16.0.3 or newer from your switch, base game and update 1.2.0, EmuDeck, and mods.

- Step 1: Go into desktop mode, install [Yuzu](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing) with EmuDeck (or use an alternative, like Sudachi or Suyu).

- Step 2: Move the keys and firmware inside `~/Emulation/bios/yuzu/` if you prefer it.

- Step 3: Move the ROMs into EmuDeck inside `~/Emulation/ROMs/switch/` and install the update.

- Step 4: Open Yuzu, go into `Emulation>Configure>Graphics` in `Graphics` change `vsync mode` to `fifo relaxed`, move to the advanced tab and switch `ASTC recompression` to `BC3`, enable `Enable asynchronous presentation` and `Force maximum clocks`, switch `VRAM usage mode` to `Aggresive` everything else is stock.

- Step 5: Download the zip file `TOTK-1.2.0-30fps.zip` and extract the content into the mods directory. With Yuzu right-click on the game and select `open mod data location`.

- Step 6: Go back into gaming mode and make sure you set in the quick access menu ![:button_aux_1:](assets/images/1054855178588795011.png?raw=true)![:button_aux_2:](assets/images/1054855180253929542.png?raw=true) the GPU clock at 1200 and lock the FPS limiter to 30. With some decks decreasing the TDP to 11/13 watts helps with battery life.

- Step 7: Enjoy your TOTK experience on Deck :]
  
> NOTE: the mods present in this repository are quite old, please use [TOTK-Optimizer](https://github.com/hoverbike1/TOTK-Mods-collection/releases) to update them with a new pack.
>
> TIP: if you are updating the mods or is the first time you are using them, clean all your pipeline shaders from TOTK in the remove section of Yuzu when you right-click on the title.

</details>

<details>
	
  <summary>PKHex on Linux: ⮧</summary>

- [pkhex](https://projectpokemon.org/home/files/file/1-pkhex/) can work on Linux with a [bottles](https://usebottles.com/) environment, by following this [link](https://projectpokemon.org/home/forums/topic/62968-pkhex-on-linux/?do=findComment&comment=282035), after installing older .net dependencies, [wine ge 9.1](https://bitbucket.org/amidevous/pkhex/downloads/wine-GE-9.1-x86_64.tar.xz) and [.net 8](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-8.0.100-windows-x64-installer), it works and the [legality plugin](https://github.com/santacrab2/PKHeX-Plugins/releases) loads too

</details>

<details>
	
  <summary>Modding and Romhacks: ⮧</summary>

- RomHack[s](https://cdromance.org/)' places:
	- https://gamebanana.com/
	- https://www.pokecommunity.com/
	- https://romhacks.org/
	- https://romhacking.com/
	- https://www.retrostic.com/
	- [https://www.romhacking.net/](https://archive.org/details/romhacking.net-20240801)
	- [https://reliccastle.com/](https://web.archive.org/web/20240321004101/https://reliccastle.com/tags/completed/)

</details>

<details>
	
  <summary>PC ports of retail games: ⮧</summary>

- Ninty [Pc](https://drive.google.com/file/d/1sSil5HH3stPDpB6HtDbs3Gk-1K-Puo8z/view?usp=sharing) ports:
  	- https://sm64pc.info/
		- https://github.com/MorsGames/sm64plus
		- https://github.com/AloUltraExt/sm64ex-alo
	- https://github.com/ihm-tswow/Links-Awakening-DX-HD
	- https://github.com/blawar/ooot
  		- https://github.com/Mr-Wiseguy/Zelda64Recomp
			- https://github.com/HarbourMasters/Shipwright
				- https://github.com/Waterdish/Shipwright-Android
  	- https://github.com/snesrev/smw
  		- https://github.com/stephini/SMAS_Launcher
  	- https://github.com/snesrev/zelda3
		- https://github.com/RadzPrower/Zelda-3-Launcher
  	- https://github.com/HarbourMasters/2ship2harkinian
  		- https://github.com/Waterdish/2ship2harkinian-Android
  
	- What you need for smw and sm64 compiling:
    
  	https://rpmfind.net/linux/fedora/linux/releases/39/Everything/x86_64/os/Packages/g/gcc-13.2.1-3.fc39.x86_64.rpm

	```
	sudo dnf install make gcc python3 glew-devel SDL2-devel
	```
	```
  	cd $HOME/Downloads
	git clone https://github.com/AloXado320/sm64ex-alo
	cd sm64ex-alo
	make BETTERCAMERA=1 EXTERNAL_DATA=1 QOL_FIXES=1 QOL_FEATURES=1 TEXTURE_FIX=1 -j$(nproc)
	make clean all
	CC=clang make
	```
	```
  	cd $HOME/Downloads
	git clone https://github.com/snesrev/smw
	cd smw
	make -j$(nproc)
	make clean all
	CC=clang make
  	```

- List of decompilation projects:
	- https://www.resetera.com/threads/decompilation-projects-ot-free-next-gen-update-for-your-favorite-classics-jak-ii-pc-port-out-in-beta.682687/
	- https://www.retroreversing.com/source-code/decompiled-retail-console-games
 
- [Super Mario Galaxy for NDS](https://cdn.discordapp.com/attachments/775383694948827176/1222191653041995816/smgds.nds?ex=6627c6ad&is=661551ad&hm=951c453c30302700d5f6c75ab9569b67395c3921bfa50dd35fee82b382c15caa&).

- [SmallAnt's Pk RomHacks](https://drive.google.com/drive/folders/1J2tHtAK-UXRYmRMl3gN8sH7yy06cZBmM?usp=drive_link).

- Citra [core](https://drive.google.com/file/d/1iM5RAYg_kq2zSY7Gbx7XBs6jcPpVaTQs/view?usp=drive_link) for NSwitch Retroarch and complete versions [pack](https://drive.google.com/file/d/1rPWZdQx-01jh8nfw974-2XGeRPK-mt3D/view?usp=drive_link).

</details>

## [BACKUP](https://drive.google.com/file/d/1lIw15MZHweBwIBEIJLSlBnySWGSEAkYI/view?usp=sharing):

<details>
	
  <summary>All the links below are the references to make the backup of the link above: ⮧</summary>

- https://github.com/qurious-pixel/dolphin/releases .
- https://github.com/cemu-project/cemu_graphic_packs/releases .
- https://github.com/RyzenDew/Lime-3DS-Emulator/releases .
- https://github.com/PabloMK7/citra/releases .
- https://github.com/mandarine3ds/mandarine .
- https://github.com/huhao1987/mGBA_Android/releases .
- https://github.com/skylersaleh/SkyEmu/releases .
- https://github.com/Hydr8gon/NooDS/releases .
- https://github.com/TASEmulators/BizHawk/releases .
- https://github.com/TASEmulators/desmume/releases .
- https://github.com/strato-emu/strato/releases .
- https://github.com/rafaelvcaetano/melonDS-android/releases .
- https://github.com/higan-emu/higan/releases .
- https://github.com/melonDS-emu/melonDS/releases .
- https://github.com/cemu-project/Cemu/releases .
- https://github.com/Rakashazi/emu-ex-plus-alpha .
- https://github.com/Rosalie241/RMG/releases .
- https://github.com/Ryujinx/release-channel-master/releases .
- https://github.com/simple64/simple64/releases .
- https://github.com/weihuoya/citra/releases .
- https://github.com/visualboyadvance-m/visualboyadvance-m/releases .
- https://github.com/decaf-emu/decaf-emu/releases .
- https://github.com/qurious-pixel/Ryujinx/releases .
- https://github.com/Medard22/Dolphin-MMJR2-VBI/releases .
- https://codeberg.org/litucks/torzu .
- https://emulationking.com/ .
- https://mikage.app/download/ .
- https://panda3ds.com/download.html .
- https://mgba.io/downloads.html .
- https://dolphin-emu.org/download/ .
- https://www.pj64-emu.com/nightly-builds .
- https://emulation.gametechwiki.com/index.php/Emulators_on_Windows#Nintendo .
- https://emulation.gametechwiki.com/index.php/Emulators_on_Linux#Nintendo .
- https://emulation.gametechwiki.com/index.php/Emulators_on_Android#Nintendo .

</details>
