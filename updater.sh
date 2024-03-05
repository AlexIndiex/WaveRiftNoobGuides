#!/bin/bash

notify() { notify-send -a "Application Updater" "$1" && echo "$1"; }
download_notify() {
        cd /home/deck/Applications || exit
        if [[ -f $(basename "${urls[0]}") ]] && [[ $1 != "Ryujinx" ]] && [[ $1 != "Cemu" ]] && [[ $1 != "Panda3DS" ]] && [[ $1 != "DolphinDev" ]] && [[ $1 != "RMG" ]] && [[ $1 != "MelonDS" ]] && [[ $1 != "MgbaDev" ]]; then
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
                                curl -L -o /home/deck/Applications/Cemu.AppImage -z /home/deck/Applications/Cemu.AppImage "${urls[0]}"
                                chmod +x /home/deck/Applications/Cemu.AppImage
                                ;;

                        Panda3DS)
                                curl -L -o ~/Applications/"$(basename https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip)" -z ~/Applications/"$(basename https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip)" https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip
                                7z x "$(basename https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip)" -y
				mv ~/Applications/Alber-x86_64.AppImage ~/Applications/Panda3DS.AppImage
                                chmod +x ~/Applications/Panda3DS.AppImage
                                ;;

                        DolphinDev)
                                curl -L -o /home/deck/Applications/DolphinDev.AppImage -z /home/deck/Applications/DolphinDev.AppImage "${urls[0]}"
                                chmod +x /home/deck/Applications/DolphinDev.AppImage
                                ;;

                        RMG)
                                curl -L -o /home/deck/Applications/RMG.AppImage -z /home/deck/Applications/RMG.AppImage "${urls[0]}"
                                chmod +x /home/deck/Applications/RMG.AppImage
                                ;;

                        MelonDS)
                                curl -L -o /home/deck/Applications/MelonDS.AppImage -z /home/deck/Applications/MelonDS.AppImage "${urls[0]}"
                                chmod +x /home/deck/Applications/MelonDS.AppImage
                                ;;

                        MgbaDev)
                                curl -L -o /home/deck/Applications/MgbaDev.AppImage -z /home/deck/Applications/MgbaDev.AppImage https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage
                                chmod +x /home/deck/Applications/MgbaDev.AppImage
                                ;;

                        *)
                                curl -s -L -o /home/deck/Applications/"$(basename "${urls[0]}")" -z /home/deck/Applications/"$(basename "${urls[0]}")" "${urls[0]}"
                                chmod +x /home/deck/Applications/"$(basename "${urls[0]}")"
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
