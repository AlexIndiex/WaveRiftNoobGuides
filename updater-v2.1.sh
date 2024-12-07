#!/bin/bash
#WaveRift - BETA Emulators autoinstall script for Linux users
#BSD 3-Clause License
#Copyright (c) 2024, Alex&Indie
#This program is free software: you can redistribute it and/or modify
#it under the terms of the BSD 3-Clause License under written permission.
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

[ -d "$HOME/Apps" ] || mkdir -p "$HOME/Apps"
ROOT_APPS_FOLDER="$HOME/Apps"

function notify() {
    notify-send -a "Application Updater" "$@"
    shift
    echo "$@"
}

function notify_die() {
    EXIT_CODE=$1
    shift
    notify "$@"
    exit "$EXIT_CODE"
}

function github_fetch() {
    return "$(curl -s -H "Accept: application/vnd.github+json" -G -d 'per_page=1' "https://api.github.com/repos/$1/releases")"
}

function filter_fetched() {
    TYPE="$1"
    shift
    jq -r ".[].assets[] | select(.browser_download_url | test(\"$TYPE\")) | .browser_download_url"
}

function fetch_citron() {
    mapfile -t urls < <(curl -s -H "https://git.citron-emu.org/api/v1/repos" -G -d 'per_page=1' "https://git.citron-emu.org/api/v1/repos/Citron/Citron/releases" | \
        jq -r '.[].assets[] | select(.browser_download_url | test("AppImage")) | .browser_download_url')
    
    if [[ -z "${urls[0]}" ]]; then
        notify_die 1 "Failed to fetch Citron download URL."
    fi
    
    echo "${urls[0]}"
}

function check_modification_time() {
    local file_path="$1"
    local local_modification_time
    local remote_modification_time

    local_modification_time=$(stat -c %Y "$file_path")
    remote_modification_time=$(curl -sI "${url[0]}" | awk '/^Last-Modified:/ {print $2 " " $3 " " $4}')

    # Compare modification times
    if [[ $local_modification_time -lt $(date -d "$remote_modification_time" +%s) ]]; then
        echo "true"  # Remote file is newer
    else
        echo "false"  # Local file is newer or same
    fi
}

function download_notify() {
    APP_FOLDER=$ROOT_APPS_FOLDER
    APP_NAME=$1
    local url
    local FETCHED_FILE
    local EXTENSION
    local REPO
    local TYPE

    case $APP_NAME in
        Citron)
            EXTENSION="AppImage"
            url=$(fetch_citron)
            ;;
        Ryujinx)
            EXTENSION="tar.gz"
            TYPE="linux_x64"
            REPO="GreemDev/Ryujinx-Canary"
            ;;
        Cemu)
            EXTENSION="AppImage"
            TYPE="$EXTENSION"
            REPO="cemu-project/Cemu"
            ;;
        Panda3DS)
            EXTENSION="zip"
            url="https://nightly.link/wheremyfoodat/Panda3DS/workflows/Qt_Build/master/Linux%20executable.zip"
            ;;
        DolphinDev)
            EXTENSION="AppImage"
            TYPE="$EXTENSION"
            REPO="qurious-pixel/dolphin"
            ;;
        RMG)
            EXTENSION="AppImage"
            TYPE="$EXTENSION"
            REPO="Rosalie241/RMG"
            ;;
        melonDS)
            EXTENSION="zip"
            TYPE="linux_x64"
            REPO="melonDS-emu/melonDS"
            ;;
        SkyEmu)
            EXTENSION="zip"
            TYPE="Linux"
            REPO="skylersaleh/SkyEmu"
            ;;
        mGBAdev)
            EXTENSION="AppImage"
            url="https://s3.amazonaws.com/mgba/mGBA-build-latest-appimage-x64.appimage"
            ;;
        mandarine)
            EXTENSION="zip"
            url="https://nightly.link/mandarine3ds/mandarine/workflows/build/master/linux-appimage.zip"
            ;;
        Lime3DS)
            EXTENSION="tar.gz"
            TYPE="appimage"
            REPO="Lime3DS/Lime3DS"
            ;;
        Gearboy)
            EXTENSION="zip"
            TYPE="ubuntu"
            REPO="drhelius/Gearboy"
            ;;
        bsnes)
            EXTENSION="zip"
            TYPE="ubuntu"
            REPO="bsnes-emu/bsnes"
            ;;
        sudachi)
            EXTENSION="7z"
            TYPE="linux"
            REPO="emuplace/sudachi.emuplace.app"
            ;;
        snes9x)
            EXTENSION="AppImage"
            TYPE="$EXTENSION"
            REPO="snes9xgit/snes9x"
            ;;
    esac

    mapfile -t url < <(github_fetch $REPO | filter_fetched $TYPE)

    FETCHED_FILE="$APP_NAME.$EXTENSION"

    notify "Checking for updates for $APP_NAME..."

    local download_required=false

    # Check if the file exists and if it's older than the remote file
    if [[ ! -f "$APP_FOLDER/$FETCHED_FILE" || $(check_modification_time "$APP_FOLDER/$FETCHED_FILE") == "true" ]]; then
        download_required=true
    fi

    if [[ "$download_required" == true ]]; then
        notify "Updating $APP_NAME..."
        curl -s -L -o "$APP_FOLDER/$FETCHED_FILE" "${url[0]}" || notify_die 1 "Update failed: $APP_NAME"

        notify "Update successful: $APP_NAME"
        case $APP_NAME in
            Ryujinx)
                tar xf "$APP_FOLDER/$FETCHED_FILE" -C "$APP_FOLDER/"
                chmod +x "$APP_FOLDER/publish/Ryujinx" "$APP_FOLDER/publish/Ryujinx.sh" "$APP_FOLDER/publish/Ryujinx.SDL2.Common.dll.config" "$APP_FOLDER/publish/mime/Ryujinx.xml"
                xdg-open https://free-git.org/Emulator-Archive/torzu/releases
                ;;
            Cemu | DolphinDev | RMG | mGBAdev | snes9x | Citron)
                chmod +x "$APP_FOLDER/$FETCHED_FILE"
                ;;
            Panda3DS | melonDS | SkyEmu)
                7z x "$APP_FOLDER/$FETCHED_FILE" -y
                mv -f "$APP_FOLDER/Alber-x86_64.AppImage" "$APP_FOLDER/Panda3DS.AppImage" && chmod +x "$APP_FOLDER/Panda3DS.AppImage"
                chmod +x "$APP_FOLDER/$APP_NAME"
                ;;
            Gearboy | bsnes | sudachi)
                7z x "$APP_FOLDER/$FETCHED_FILE" -o* -y
                chmod +x "$APP_FOLDER/$APP_NAME/gearboy" "$APP_FOLDER/$APP_NAME/bsnes-nightly/bsnes" "$APP_FOLDER/$APP_NAME/sudachi" "$APP_FOLDER/$APP_NAME/sudachi-cmd" "$APP_FOLDER/$APP_NAME/tzdb2nx"
                ;;
            Lime3DS) # also mandarine
                [ -d "$HOME/Apps/Lime3DS" ] || mkdir -p "$HOME/Apps/Lime3DS"
                tar xf "$APP_FOLDER/$FETCHED_FILE" -C "$APP_FOLDER/Lime3DS" --strip-components=1
                chmod +x "$APP_FOLDER/$APP_NAME/lime3ds-cli.AppImage" "$APP_FOLDER/$APP_NAME/lime3ds-gui.AppImage" "$APP_FOLDER/$APP_NAME/lime3ds-room.AppImage"
                ;;
            mandarine)
                [ -d "$HOME/Apps/mandarine" ] || mkdir -p "$HOME/Apps/mandarine"
                7z x "$APP_FOLDER/$FETCHED_FILE" -y
                mv -f "$APP_FOLDER/mandarine*.tar.gz" "$APP_FOLDER/mandarine.tar.gz"
                tar xf "$APP_FOLDER/mandarine.tar.gz" -C "$APP_FOLDER/mandarine" --strip-components=1 
                rm -f "$APP_FOLDER/mandarine.tar.gz"
                chmod +x "$APP_FOLDER/mandarine/mandarine-cli.AppImage" "$APP_FOLDER/mandarine/mandarine-gui.AppImage" "$APP_FOLDER/mandarine/mandarine-room.AppImage"
                ;;
        esac
    else
        notify "$APP_NAME is already up to date."
    fi
}

# Flatpak
# ------------
notify "Flatpak updating"
flatpak update -y --noninteractive | sed -e '/Info\:/d' -e '/^$/d'

# Update applications
# -------------------
mkdir -p "$ROOT_APPS_FOLDER"
pushd "$ROOT_APPS_FOLDER" || exit
for APP in Ryujinx Citron sudachi Cemu Panda3DS DolphinDev RMG melonDS SkyEmu mGBAdev Lime3DS Gearboy bsnes snes9x mandarine; do
    download_notify "$APP"
done
popd || exit
