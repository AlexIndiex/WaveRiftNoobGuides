#!/bin/bash

mkdir -p "$HOME/Apps"
notify() { notify-send -a "Application Updater" "$1" && echo "$1"; }

check_modification_time() {
    local file_path=$1
    local local_modification_time=$(stat -c %Y "$file_path")
    local remote_modification_time=$(curl -sI "${url[0]}" | awk '/^Last-Modified:/ {print $2 " " $3 " " $4}')
    
    # Compare modification times
    if [[ $local_modification_time -lt $(date -d "$remote_modification_time" +%s) ]]; then
        echo "true"  # Remote file is newer
    else
        echo "false"  # Local file is newer or same
    fi
}

download_notify() {
    cd "$HOME/Apps" || exit
    local app_name=$1
    local url
    local file_name
    
    case $app_name in
            
        Ryujinx)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Ryujinx/release-channel-master/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("linux_x64")) | .browser_download_url')
            file_name="Ryujinx.tar.gz"
            ;;
        Cemu)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/cemu-project/Cemu/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
            file_name="Cemu.AppImage"
            ;;
        Panda3DS)
            url="https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip"
            file_name="Panda3DS.zip"
            ;;
        DolphinDev)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/qurious-pixel/dolphin/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
            file_name="DolphinDev.AppImage"
            ;;
        RMG)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Rosalie241/RMG/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
            file_name="RMG.AppImage"
            ;;
        melonDS)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/melonDS-emu/melonDS/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("linux_x64")) | .browser_download_url')
            file_name="melonDS.zip"
            ;;
        SkyEmu)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/skylersaleh/SkyEmu/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("Linux")) | .browser_download_url')
            file_name="SkyEmu.zip"
            ;;
        mGBAdev)
            url="https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage"
            file_name="mGBAdev.AppImage"
            ;;
        Sudachi)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/sudachi-emu/sudachi/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("linux")) | .browser_download_url')
            file_name="Sudachi.7z"
            ;;
        Lime3DS)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/Lime3DS/Lime3DS/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
            file_name="Lime3DS.tar.gz"
            ;;
        citraPMK)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/PabloMK7/citra/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
            file_name="citraPMK.7z"
            ;;
        Citra-Enhanced)
            mapfile -t url < <(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' https://api.github.com/repos/CitraEnhanced/citra/releases | \
                    jq -r '.[].assets[] | select(.browser_download_url | test("appimage")) | .browser_download_url')
            file_name="Citra-Enhanced.zip"
            ;;
        *)
            ;;
    esac

    notify "Checking for updates for $app_name..." # Debugging output

    local download_required=false

    # Check if the file exists and if it's older than the remote file
    if [[ ! -f "$HOME/Apps/$file_name" || $(check_modification_time "$HOME/Apps/$file_name") == "true" ]]; then
        download_required=true
    fi

    if [[ "$download_required" == true ]]; then
        notify "Updating $app_name..."  # Debugging output
        curl -s -L -o "$HOME/Apps/$file_name" "${url[0]}"
        if [ $? -eq 0 ]; then
            notify "Update successful: $app_name"
            # Extract and set permissions
            case $app_name in
                
                Ryujinx)
                    tar xf "$HOME/Apps/$file_name" -C "$HOME/Apps/"
                    chmod +x "$HOME/Apps/publish/Ryujinx" "$HOME/Apps/publish/Ryujinx.sh" "$HOME/Apps/publish/Ryujinx.SDL2.Common.dll.config" "$HOME/Apps/publish/mime/Ryujinx.xml"
                    ;;
                Cemu | DolphinDev | RMG | mGBAdev)
                    chmod +x "$HOME/Apps/$file_name"
                    ;;
                Panda3DS | melonDS | SkyEmu)
                    7z x "$HOME/Apps/$file_name" -y
                    mv -f "$HOME/Apps/Alber-x86_64.AppImage" "$HOME/Apps/Panda3DS.AppImage"
                    chmod +x "$HOME/Apps/$file_name"
                    ;;
                Sudachi | citraPMK | Citra-Enhanced)
                    7z x "$HOME/Apps/$file_name" -o* -y
                    chmod +x "$HOME/Apps/Sudachi/sudachi" "$HOME/Apps/Sudachi/sudachi-cmd" "$HOME/Apps/citraPMK/head/citra.AppImage" "$HOME/Apps/citraPMK/head/citra-qt.AppImage" "$HOME/Apps/citraPMK/head/citra-room.AppImage" "$HOME/Apps/Citra-Enhanced/head/citra.AppImage" "$HOME/Apps/Citra-Enhanced/head/citra-qt.AppImage" "$HOME/Apps/Citra-Enhanced/head/citra-room.AppImage"
                    xdg-open https://github.com/litucks/torzu/releases
                    ;;
                Lime3DS)
                    mkdir -p "$HOME/Apps/Lime3DS"
                    tar xf "$HOME/Apps/$file_name" -C "$HOME/Apps/Lime3DS" --strip-components=1
                    chmod +x "$HOME/Apps/Lime3DS/lime3ds-cli.AppImage" "$HOME/Apps/Lime3DS/lime3ds-gui.AppImage" "$HOME/Apps/Lime3DS/lime3ds-room.AppImage"
                    ;:
                *)
                    ;;
            esac
        else
            notify "Update failed: $app_name"
        fi
    else
        notify "$app_name is already up to date."
    fi
}

#Flatpak
#------------
notify "Flatpak updating"
flatpak update -y --noninteractive | sed -e '/Info\:/d' -e '/^$/d'

# Update applications
# -------------------
download_notify Ryujinx
download_notify Cemu
download_notify Panda3DS
download_notify DolphinDev
download_notify RMG
download_notify melonDS
download_notify SkyEmu
download_notify mGBAdev
download_notify Sudachi
download_notify Lime3DS
download_notify citraPMK
download_notify Citra-Enhanced
