#!/bin/zsh

function download_font() {
  font_url=$1
  wget -nv -N $font_url
}

# ORIGINAL FONTS
IOSEVKA_VER=5.2.1
CASCADIA_VER=2102.25
FIRA_VER=5.2
JETBRAINS_VER=2.225
original_fonts=(
  https://github.com/be5invis/Iosevka/releases/download/v5.2.1/super-ttc-iosevka-${IOSEVKA_VER}.zip
  https://github.com/be5invis/Iosevka/releases/download/v5.2.1/super-ttc-iosevka-aile-${IOSEVKA_VER}.zip
  https://github.com/be5invis/Iosevka/releases/download/v5.2.1/super-ttc-iosevka-curly-${IOSEVKA_VER}.zip
  https://github.com/be5invis/Iosevka/releases/download/v5.2.1/super-ttc-iosevka-curly-slab-${IOSEVKA_VER}.zip
  https://github.com/be5invis/Iosevka/releases/download/v5.2.1/super-ttc-iosevka-etoile-${IOSEVKA_VER}.zip
  https://github.com/be5invis/Iosevka/releases/download/v5.2.1/super-ttc-iosevka-slab-${IOSEVKA_VER}.zip
  https://github.com/microsoft/cascadia-code/releases/download/v${CASCADIA_VER}/CascadiaCode-${CASCADIA_VER}.zip
  https://github.com/tonsky/FiraCode/releases/download/${FIRA_VER}/Fira_Code_v${FIRA_VER}.zip
  https://download.jetbrains.com/fonts/JetBrainsMono-${JETBRAINS_VER}.zip
)

function download_og_fonts() {
  echo "START DOWNLOADING OG FONTS"

  for font_url in ${original_fonts[@]}; do
    download_font $font_url
  done

  echo "DONE DOWNLOADING OG FONTS"
}
download_og_fonts

# NERD FONTS SECTION
nerd_fonts=(
  "Iosevka"
  "CascadiaCode"
  "FiraCode"
  "FiraMono"
  "JetBrainsMono"
)

function download_nerd_fonts() {
  echo "START DOWNLOADING NERD FONTS"
  NF_VERSION=2.1.0
  NF_URL_PREFIX=https://github.com/ryanoasis/nerd-fonts/releases/download/v${NF_VERSION}
  NF_URL_SUFFIX=.zip

  for nf in "${nerd_fonts[@]}"; do
    nerd_font=${NF_URL_PREFIX}/${nf}${NF_URL_SUFFIX}
    download_font $nerd_font
  done

  echo "DONE DOWNLOADING NERD FONTS"
}
download_nerd_fonts
