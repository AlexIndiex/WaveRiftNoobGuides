#!/bin/bash

mkdir -p "$HOME/Apps"
notify() { notify-send -a "Application Updater" "$1" && echo "$1"; }

download_notify() {
    local url=$1
    local app_name=$2
    local file_name=$(basename "$url")
    local local_modification_time
    local remote_modification_time
    local download_required=false

    notify "Checking for updates for $app_name..."  # Debugging output

    # Check if the file exists
    if [[ -f "$HOME/Apps/$file_name" ]]; then
        local_modification_time=$(date -r "$HOME/Apps/$file_name" +%s)
        remote_modification_time=$(curl -sI "$url" | awk '/Last-Modified/ {print $3,$4,$5}')
        remote_modification_time=$(date -d"$remote_modification_time" +%s)

        # Compare modification times
        if [[ $local_modification_time -lt $remote_modification_time ]]; then
            download_required=true
        fi
    else
        download_required=true
    fi

    if [[ "$download_required" == true ]]; then
        notify "Updating $app_name..."  # Debugging output
        curl -s -L -o "$HOME/Apps/$file_name" "$url"
        if [ $? -eq 0 ]; then
            notify "Update successful: $app_name"
            # Extract and set permissions if necessary
            case $app_name in
                Ryujinx)
                    tar xf "$HOME/Apps/$file_name" -C "$HOME/Apps/"
                    chmod +x "$HOME/Apps/publish/Ryujinx" "$HOME/Apps/publish/Ryujinx.sh" "$HOME/Apps/publish/Ryujinx.SDL2.Common.dll.config" "$HOME/Apps/publish/mime/Ryujinx.xml"
                    ;;
                Cemu | DolphinDev | RMG | mGBAdev)
                    chmod +x "$HOME/Apps/$file_name"
                    ;;
                Panda3DS | melonDS | SkyEmu | Sudachi | citraPMK)
                    7z x "$HOME/Apps/$file_name" -o"$HOME/Apps/" -y
                    mv -f "$HOME/Apps/Alber-x86_64.AppImage" "$HOME/Apps/Panda3DS.AppImage"
		    chmod +x "$HOME/Apps/$file_name" "$HOME/Apps/Sudachi/sudachi" "$HOME/Apps/Sudachi/sudachi-cmd" "$HOME/Apps/citraPMK/head/citra.AppImage" "$HOME/Apps/citraPMK/head/citra-qt.AppImage" "$HOME/Apps/citraPMK/head/citra-room.AppImage"
                    ;;
                Lime3DS)
                    mkdir -p "$HOME/Apps/Lime3DS"
                    tar xf "$HOME/Apps/$file_name" -C "$HOME/Apps/Lime3DS" --strip-components=1
                    chmod +x "$HOME/Apps/Lime3DS/lime3ds-cli.AppImage" "$HOME/Apps/Lime3DS/lime3ds-gui.AppImage" "$HOME/Apps/Lime3DS/lime3ds-room.AppImage"
                    ;;
                Citra-Enhanced)
                    7z x "$HOME/Apps/$file_name" -o"$HOME/Apps/" -y
		    mv -f "$HOME/Apps/citra*7z" "$HOME/Apps/Citra-Enhanced.7z"
		    7z x "$HOME/Apps/Citra-Enhanced.7z" -o"$HOME/Apps/" -y
                    chmod +x "$HOME/Apps/Citra-Enhanced/head/citra.AppImage" "$HOME/Apps/Citra-Enhanced/head/citra-qt.AppImage" "$HOME/Apps/Citra-Enhanced/head/citra-room.AppImage"
                    ;;
                *)
                    ;;
            esac
        else
            notify "Update failed: $app_name"
        fi
    else
        notify "$app_name is already up to date."  # Debugging output
    fi
}

#Flatpak
#------------
notify "Flatpak updating"
flatpak update -y --noninteractive | sed -e '/Info\:/d' -e '/^$/d'

#Ryujinx
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Ryujinx/release-channel-master/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux_x64")) | .browser_download_url')
download_notify "${urls[0]}" Ryujinx "Ryujinx.tar.gz"

#Cemu
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/cemu-project/Cemu/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify "${urls[0]}" Cemu "Cemu.AppImage"

#Panda3DS
#------------
download_notify "https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip" Panda3DS "Panda3DS.zip"

#DolphinDev
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/qurious-pixel/dolphin/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify "${urls[0]}" DolphinDev "DolphinDev.AppImage"

#RMG
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Rosalie241/RMG/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
download_notify "${urls[0]}" RMG "RMG.AppImage"

#melonDS
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/melonDS-emu/melonDS/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux_x64")) | .browser_download_url')
download_notify "${urls[0]}" melonDS "melonDS.zip"

#SkyEmu
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/skylersaleh/SkyEmu/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("Linux")) | .browser_download_url')
download_notify "${urls[0]}" SkyEmu "SkyEmu.zip"

#mGBAdev
#------------
download_notify "https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage" mGBAdev "mGBAdev.AppImage"

#Sudachi
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/sudachi-emu/sudachi/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("linux")) | .browser_download_url')
download_notify "${urls[0]}" Sudachi "Sudachi.7z"

#Lime3DS
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Lime3DS/Lime3DS/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify "${urls[0]}" Lime3DS "Lime3DS.tar.gz"

#citraPMK
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/PabloMK7/citra/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify "${urls[0]}" citraPMK "citraPMK.7z"

#Citra-Enhanced
#------------
mapfile -t urls < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Gamer64ytb/Citra-Enhanced/releases | \
        jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
download_notify "${urls[0]}" Citra-Enhanced "Citra-Enhanced.zip"
