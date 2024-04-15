#!/bin/bash

notify() { notify-send -a "Application Updater" "$1" && echo "$1"; }
download_notify() {
        cd ~/Applications || exit
        if [[ -f $(basename "${urls[0]}") ]] && [[ $1 != "Ryujinx" ]] && [[ $1 != "Cemu" ]] && [[ $1 != "Panda3DS" ]] && [[ $1 != "DolphinDev" ]] && [[ $1 != "RMG" ]] && [[ $1 != "melonDS" ]] && [[ $1 != "SkyEmu" ]] && [[ $1 != "mGBAdev" ]] && [[ $1 != "Sudachi" ]] && [[ $1 != "Lime3DS" ]] && [[ $1 != "citraPMK7" ]]; then
                notify "Already up to date: $1"
        else
                notify "Updating: $1"
                case $1 in
                        
                        Ryujinx)
                                curl -L -o ~/Applications/Ryujinx.tar.gz -z ~/Applications/Ryujinx.tar.gz "${urls[0]}"
                                tar xf Ryujinx.tar.gz
                                chmod +x ~/Applications/publish/Ryujinx
                                chmod +x ~/Applications/publish/Ryujinx.sh
                                chmod +x ~/Applications/publish/Ryujinx.SDL2.Common.dll.config
                                chmod +x ~/Applications/publish/mime/Ryujinx.xml
                                ;;
                        
                        Cemu)
                                curl -L -o ~/Applications/Cemu.AppImage -z ~/Applications/Cemu.AppImage "${urls[0]}"
                                chmod +x ~/Applications/Cemu.AppImage
                                ;;
                        
                        Panda3DS)
                                curl -L -o ~/Applications/Panda3DS.zip -z ~/Applications/Panda3DS.zip https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip
                                7z x Panda3DS.zip -y
                                mv ~/Applications/Alber-x86_64.AppImage ~/Applications/Panda3DS.AppImage
                                chmod +x ~/Applications/Panda3DS.AppImage
                                ;;
                        
                        DolphinDev)
                                curl -L -o ~/Applications/DolphinDev.AppImage -z ~/Applications/DolphinDev.AppImage "${urls[0]}"
                                chmod +x ~/Applications/DolphinDev.AppImage
                                ;;
                        
                        RMG)
                                curl -L -o ~/Applications/RMG.AppImage -z ~/Applications/RMG.AppImage "${urls[0]}"
                                chmod +x ~/Applications/RMG.AppImage
                                ;;
                        
                        melonDS)
                                curl -L -o ~/Applications/melonDS.zip -z ~/Applications/melonDS.zip "${urls[0]}"
                                7z x melonDS.zip -y
                                chmod +x ~/Applications/melonDS
                                ;;
                        
                        SkyEmu)
                                curl -L -o ~/Applications/SkyEmu.zip -z ~/Applications/SkyEmu.zip "${urls[0]}"
                                7z x SkyEmu.zip -y
                                chmod +x ~/Applications/SkyEmu
                                ;;
                        
                        mGBAdev)
                                curl -L -o ~/Applications/mGBAdev.AppImage -z ~/Applications/mGBAdev.AppImage https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage
                                chmod +x ~/Applications/mGBAdev.AppImage
                                ;;
                        
                        #        chmod +x ~/Applications/suyu.AppImage
                        #        ;;
                                                
                        Sudachi)
                                curl -L -o ~/Applications/Sudachi.7z -z ~/Applications/Sudachi.7z "${urls[0]}"
                                7z x Sudachi.7z -o* -y
                                chmod +x ~/Applications/Sudachi/sudachi
                                chmod +x ~/Applications/Sudachi/sudachi-cmd
                                ;;
                        
                        Lime3DS)
                                curl -L -o ~/Applications/Lime3DS.7z -z ~/Applications/Lime3DS.7z "${urls[0]}"
                                7z x Lime3DS.7z -o* -y
                                chmod +x ~/Applications/Lime3DS/*/lime.AppImage
                                chmod +x ~/Applications/Lime3DS/*/lime-qt.AppImage
                                chmod +x ~/Applications/Lime3DS/*/lime-room.AppImage
                                ;;
                         
                        citraPMK7)
                                curl -L -o ~/Applications/citraPMK7.7z -z ~/Applications/citraPMK7.7z "${urls[0]}"
                                7z x citraPMK7.7z -o* -y
                                chmod +x ~/Applications/citraPMK7/head/citra.AppImage
                                chmod +x ~/Applications/citraPMK7/head/citra-qt.AppImage
                                chmod +x ~/Applications/citraPMK7/head/citra-room.AppImage
                                ;;
                        
                        #Lemonade)
                        #        curl -L -o ~/Applications/Lemonade.zip -z ~/Applications/Lemonade.zip "${urls[0]}"
                        #        7z x Lemonade.zip lemonade*7z -y
                        #        mv ~/Applications/lemonade*7z ~/Applications/Lemonade.7z
                        #        7z x Lemonade.7z -o* -y
                        #        chmod +x ~/Applications/Lemonade/head/lemonade.AppImage
                        #        chmod +x ~/Applications/Lemonade/head/lemonade-qt.AppImage
                        #        chmod +x ~/Applications/Lemonade/head/lemonade-room.AppImage
                        #        ;;
                        
                        *)
                                curl -s -L -o ~/Applications/"$(basename "${urls[0]}")" -z ~/Applications/"$(basename "${urls[0]}")" "${urls[0]}"
                                chmod +x ~/Applications/"$(basename "${urls[0]}")"
                                ;;
                esac
        fi;}

#Flatpak
#------------
notify "Flatpak updating"
flatpak update -y --noninteractive | sed -e '/Info\:/d' -e '/^$/d'

#Ryujinx
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Ryujinx/release-channel-master/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux_x64")) | .browser_download_url')
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

#suyu
#------------
#mapfile -t urls < <(curl -s -H "https://git.suyu.dev/api/v1/repos" -G -d 'per_page=1' https://git.suyu.dev/api/v1/repos/suyu/suyu/releases | \
#        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
#download_notify suyu

#Sudachi
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/sudachi-emu/sudachi/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux")) | .browser_download_url')
download_notify Sudachi

#Lime3DS
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Lime3DS/Lime3DS/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify Lime3DS

#citraPMK7
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/PabloMK7/citra/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify citraPMK7

#Lemonade
#------------
#mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Lemonade-emu/Lemonade/releases | \
#        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
#download_notify Lemonade
