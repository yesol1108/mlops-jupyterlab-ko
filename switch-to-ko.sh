#!/bin/bash
set -e

echo "🔄 Switching Jukebox lab to Korean version..."

LAB_DIR="$HOME/jukebox"
KO_REPO="https://github.com/yesol1108/mlops-jupyterlab-ko.git"

if [ ! -d "$LAB_DIR" ]; then
  echo "❌ $LAB_DIR not found. Are you in the correct environment?"
  exit 1
fi

TMP_DIR=$(mktemp -d)

echo "⬇️ Downloading Korean lab repository..."
git clone --depth 1 "$KO_REPO" "$TMP_DIR"

echo "🔁 Replacing Jukebox contents..."
rm -rf "$LAB_DIR"/*
cp -R "$TMP_DIR/jukebox/"* "$LAB_DIR/"

echo "🧹 Cleaning up..."
rm -rf "$TMP_DIR"

echo "✅ Jukebox lab successfully switched to Korean version!"
echo "👉 Please refresh your JupyterLab or reopen the notebooks."
