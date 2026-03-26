#!/bin/bash
set -e

APP_NAME="Slash"
DMG_URL="https://ytw0728.github.io/docs/slash/desktops/v1.0.0/Slash_1.0.0_universal.dmg"
DMG_PATH="/tmp/Slash_install.dmg"
MOUNT_DIR="/tmp/slash_dmg_mount"
INSTALL_DIR="/Applications"

# Acquire sudo upfront
sudo -v

echo "Downloading ${APP_NAME}..."
curl -fSL "$DMG_URL" -o "$DMG_PATH"

echo "Mounting DMG..."
hdiutil attach "$DMG_PATH" -mountpoint "$MOUNT_DIR" -nobrowse -quiet

echo "Installing to ${INSTALL_DIR}..."
if [ -d "${INSTALL_DIR}/${APP_NAME}.app" ]; then
    sudo rm -rf "${INSTALL_DIR}/${APP_NAME}.app"
fi
sudo cp -R "${MOUNT_DIR}/${APP_NAME}.app" "${INSTALL_DIR}/"

echo "Unmounting DMG..."
hdiutil detach "$MOUNT_DIR" -quiet
rm -f "$DMG_PATH"

# Remove quarantine attribute to bypass Gatekeeper
sudo xattr -cr "${INSTALL_DIR}/${APP_NAME}.app" 2>/dev/null || true

echo "Done! ${APP_NAME} is installed in ${INSTALL_DIR}."
open "${INSTALL_DIR}/${APP_NAME}.app"
