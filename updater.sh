#!/bin/bash

notify() { notify-send -a "Application Updater" "$1" && echo "$1"; }
download_notify() {
        cd ~/Applications || exit
        if [[ -f $(basename "${urls[0]}") ]] && [[ $1 != "Ryujinx" ]] && [[ $1 != "Cemu" ]] && [[ $1 != "Panda3DS" ]] && [[ $1 != "DolphinDev" ]] && [[ $1 != "RMG" ]] && [[ $1 != "MelonDS" ]] && [[ $1 != "MgbaDev" ]] && [[ $1 != "Suyu" ]]; then
                notify "Already up to date: $1"
        else
                notify "Updating: $1"
                case $1 in

                        Ryujinx)
                                curl -L -o ~/Applications/"$(basename "${urls[0]}")" -z /home/deck/Applications/"$(basename "${urls[0]}")" "${urls[0]}"
                                tar xf "$(basename "${urls[0]}")"
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
                                curl -L -o ~/Applications/"$(basename https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip)" -z ~/Applications/"$(basename https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip)" https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip
                                7z x "$(basename https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip)" -y
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

                        MelonDS)
                                curl -L -o ~/Applications/"$(basename "${urls[0]}")" -z /home/deck/Applications/"$(basename "${urls[0]}")" "${urls[0]}"
                                7z x "$(basename "${urls[0]}")" -y
                                chmod +x ~/Applications/melonDS
                                ;;

                        MgbaDev)
                                curl -L -o ~/Applications/MgbaDev.AppImage -z ~/Applications/MgbaDev.AppImage https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage
                                chmod +x ~/Applications/MgbaDev.AppImage
                                ;;
				
                        Suyu)
                                curl -L -o ~/Applications/suyu.AppImage -z ~/Applications/suyu.AppImage "${urls[0]}"
                                chmod +x ~/Applications/suyu.AppImage
                                ;;

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

#MelonDS
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/melonDS-emu/melonDS/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux_x64")) | .browser_download_url')
download_notify MelonDS

#MgbaDev
#------------
download_notify MgbaDev

#Suyu
#------------
mapfile -t urls < <(curl -s -H "https://gitlab.com/api/v4/projects" -G -d 'per_page=1' https://gitlab.com/api/v4/projects/suyu-emu%2Fsuyu/releases | \
        jq -r '.[].assets.sources[] | select(.url | test("Appimage")) | .url')
download_notify Suyu
