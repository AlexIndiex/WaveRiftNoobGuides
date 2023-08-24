#!/bin/bash

notify() { notify-send -a "Application Updater" "$1" && echo "$1"; }
download_notify() {
        cd /home/deck/Applications || exit
        if [[ -f $(basename "${urls[0]}") ]] && [[ $1 != "DolphinDev" ]] && [[ $1 != "Cemu" ]] && [[ $1 != "yuzuEA" ]] && [[ $1 != "mgbaDev" ]]; then
                notify "Already up to date: $1"
        else
                notify "Updating: $1"
                case $1 in

                        DolphinDev)
                                curl -L -o ~/Applications/DolphinDev.AppImage -z ~/Applications/DolphinDev.AppImage https://github.com/qurious-pixel/dolphin/releases/download/continuous/Dolphin_Emulator-x86_64.AppImage
                                chmod +x ~/Applications/DolphinDev.AppImage
                                ;;
                        Cemu)
                                curl -L -o /home/deck/Applications/Cemu.AppImage -z /home/deck/Applications/Cemu.AppImage "${urls[0]}"
                                chmod +x /home/deck/Applications/Cemu.AppImage
                                ;;
                        yuzuEA)
                                curl -L -o /home/deck/Applications/yuzuEA.AppImage -z /home/deck/Applications/yuzuEA.AppImage "${urls[0]}"
                                chmod +x /home/deck/Applications/yuzuEA.AppImage
                                ;;
                        mgbaDev)
                                curl -L -o /home/deck/Applications/mgbaDev.AppImage -z /home/deck/Applications/mgbaDev.AppImage https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage
                                chmod +x /home/deck/Applications/mgbaDev.AppImage
                                ;;
                        citracanary)
                                curl -L -o ~/Applications/"$(basename "${urls[0]}")" "${urls[0]}"
                                7z x "$(basename "${urls[0]}")" -y
                                chmod +x ~/Applications/canary/citra.AppImage
                                chmod +x ~/Applications/canary/citra-qt.AppImage
                                chmod +x ~/Applications/canary/citra-room.AppImage
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

#DolphinDev
#------------
download_notify DolphinDev

#Cemu
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/cemu-project/Cemu/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify Cemu

#yuzuEA
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/pineappleEA/pineapple-src/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify yuzuEA

#citracanary
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/citra-emu/citra-canary/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify citracanary

#mgbaDev
#------------
download_notify mgbaDev
