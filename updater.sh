#!/bin/bash
#WaveRift - BETA Emulators autoinstall script for Linux users
#BSD 3-Clause License
#Copyright (c) 2024, Alex&Indie
#This program is free software: you can redistribute it and/or modify
#it under the terms of the BSD 3-Clause License under written permission.
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

[ -d "$HOME/Applications" ] || mkdir -p "$HOME/Applications"
notify() { notify-send -a "Application Updater" "$1" && echo "$1"; }
download_notify() {
        cd ~/Applications || exit
        if [[ -f $(basename "${urls[0]}") ]] && [[ $1 != "Ryujinx" ]]  && [[ $1 != "Citron" ]] && [[ $1 != "sudachi" ]] && [[ $1 != "Cemu" ]] && [[ $1 != "Panda3DS" ]] && [[ $1 != "DolphinDev" ]] && [[ $1 != "RMG" ]] && [[ $1 != "melonDS" ]] && [[ $1 != "SkyEmu" ]] && [[ $1 != "mGBAdev" ]] && [[ $1 != "Lime3DS" ]] && [[ $1 != "mandarine" ]] && [[ $1 != "citraPMK" ]] && [[ $1 != "GearBoy" ]] && [[ $1 != "bsnes" ]] && [[ $1 != "snes9x" ]]; then
                notify "Already up to date: $1"
        else
                notify "Updating: $1"
                case $1 in
                        Citron)
                                curl -L -o ~/Applications/Citron.AppImage -z ~/Applications/Citron.AppImage "${urls[0]}" && chmod +x ~/Applications/Citron.AppImage
                                ;;
                        Ryujinx)
                                curl -L -o ~/Applications/Ryujinx.AppImage -z ~/Applications/Ryujinx.AppImage "${urls[0]}" && chmod +x ~/Applications/Ryujinx.AppImage
                                ;;
                        Cemu)
                                curl -L -o ~/Applications/Cemu.AppImage -z ~/Applications/Cemu.AppImage "${urls[0]}" && chmod +x ~/Applications/Cemu.AppImage
                                ;;
                        snes9x)
                                curl -L -o ~/Applications/snes9x.AppImage -z ~/Applications/snes9x.AppImage "${urls[0]}" && chmod +x ~/Applications/snes9x.AppImage
                                ;;
                        Panda3DS)
                                curl -L -o ~/Applications/Panda3DS.zip -z ~/Applications/Panda3DS.zip https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip && 7z x Panda3DS.zip -y && mv -f ~/Applications/Alber-x86_64.AppImage ~/Applications/Panda3DS.AppImage && chmod +x ~/Applications/Panda3DS.AppImage
                                ;;
                        DolphinDev)
                                curl -L -o ~/Applications/DolphinDev.AppImage -z ~/Applications/DolphinDev.AppImage "${urls[0]}" && chmod +x ~/Applications/DolphinDev.AppImage
                                ;;
                        RMG)
                                curl -L -o ~/Applications/RMG.AppImage -z ~/Applications/RMG.AppImage "${urls[0]}" && chmod +x ~/Applications/RMG.AppImage
                                ;;
                        melonDS)
                                curl -L -o ~/Applications/melonDS.zip -z ~/Applications/melonDS.zip "${urls[0]}" && 7z x melonDS.zip -y && chmod +x ~/Applications/melonDS
                                ;;
                        SkyEmu)
                                curl -L -o ~/Applications/SkyEmu.zip -z ~/Applications/SkyEmu.zip "${urls[0]}" && 7z x SkyEmu.zip -y && chmod +x ~/Applications/SkyEmu
                                ;;
                        mGBAdev)
                                curl -L -o ~/Applications/mGBAdev.AppImage -z ~/Applications/mGBAdev.AppImage https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage && chmod +x ~/Applications/mGBAdev.AppImage
                                ;;
                        Lime3DS)
                                [ -d "$HOME/Applications/Lime3DS" ] || mkdir -p "$HOME/Applications/Lime3DS" && curl -L -o ~/Applications/Lime3DS.tar.gz -z ~/Applications/Lime3DS.tar.gz "${urls[0]}" && tar xf Lime3DS.tar.gz -C ~/Applications/Lime3DS --strip-components=1 && chmod +x ~/Applications/Lime3DS/lime3ds-cli.AppImage ~/Applications/Lime3DS/lime3ds-gui.AppImage ~/Applications/Lime3DS/lime3ds-room.AppImage
                                ;;
                        mandarine)
                                [ -d "$HOME/Applications/mandarine" ] || mkdir -p "$HOME/Applications/mandarine" && curl -s -L -o ~/Applications/linux-appimage.zip -z ~/Applications/linux-appimage.zip https://nightly.link/mandarine3ds/mandarine/workflows/build/master/linux-appimage.zip && 7z x ~/Applications/linux-appimage.zip -y && mv -f ~/Applications/mandarine*.tar.gz ~/Applications/mandarine.tar.gz && tar xf ~/Applications/mandarine.tar.gz -C ~/Applications/mandarine --strip-components=1 && rm -f ~/Applications/mandarine.tar.gz && chmod +x ~/Applications/mandarine/mandarine-cli.AppImage ~/Applications/mandarine/mandarine-gui.AppImage ~/Applications/mandarine/mandarine-room.AppImage
                                ;; 
                        bsnes)
                                curl -L -o ~/Applications/bsnes.zip -z ~/Applications/bsnes.zip "${urls[0]}" && 7z x bsnes.zip -o* -y && chmod +x ~/Applications/bsnes/bsnes-nightly/bsnes
                                ;;
                        sudachi)
                                curl -L -o ~/Applications/sudachi.7z -z ~/Applications/sudachi.7z "${urls[0]}" && 7z x sudachi.7z -o* -y && chmod +x ~/Applications/sudachi/sudachi ~/Applications/sudachi/sudachi-cmd ~/Applications/sudachi/tzdb2nx
                                ;;
                        GearBoy)
                                curl -L -o ~/Applications/GearBoy.zip -z ~/Applications/GearBoy.zip "${urls[0]}" && 7z x GearBoy.zip -o* -y && chmod +x ~/Applications/GearBoy/gearboy
                                ;;
                        *)
                                curl -s -L -o ~/Applications/"$(basename "${urls[0]}")" -z ~/Applications/"$(basename "${urls[0]}")" "${urls[0]}" && chmod +x ~/Applications/"$(basename "${urls[0]}")"
                                ;;
                esac
        fi;}

#Flatpak
#------------
notify "Flatpak updating"
flatpak update -y --noninteractive | sed -e '/Info\:/d' -e '/^$/d'

#Citron
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Samueru-sama/Citron-AppImage-test/releases | \
        jq -r '[.[] | select(.tag_name == "nightly")][].assets[] | select(.browser_download_url | test("anylinux-x86_64_v3.AppImage")) | .browser_download_url')
download_notify Citron

#Ryujinx
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Ryubing/Canary-Releases/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("x64.AppImage")) | .browser_download_url')
download_notify Ryujinx

#Cemu
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/cemu-project/Cemu/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify Cemu

#Panda3DS
#------------
download_notify Panda3DS

#DolphinDev
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/qurious-pixel/dolphin/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify DolphinDev

#RMG
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Rosalie241/RMG/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify RMG

#melonDS
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/melonDS-emu/melonDS/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux_x64")) | .browser_download_url')
download_notify melonDS

#SkyEmu
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/skylersaleh/SkyEmu/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("Linux")) | .browser_download_url')
download_notify SkyEmu

#mGBAdev
#------------
download_notify mGBAdev

#mandarine
#------------
download_notify mandarine

#Lime3DS
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Lime3DS/Lime3DS/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify Lime3DS

#GearBoy
#------------
mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/drhelius/Gearboy/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("ubuntu")) | .browser_download_url')
download_notify Gearboy

#bsnes
#------------
mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/bsnes-emu/bsnes/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("ubuntu")) | .browser_download_url')
download_notify bsnes

#sudachi
#------------
mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/emuplace/sudachi.emuplace.app/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux")) | .browser_download_url')
download_notify sudachi

#snes9x
#------------
mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/snes9xgit/snes9x/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify snes9x
