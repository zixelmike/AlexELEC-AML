################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libretro-glupen64"
PKG_VERSION="04adfb2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/GLupeN64/GLupeN64"
PKG_URL="https://github.com/GLupeN64/GLupeN64/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="GLupeN64-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain nasm:host"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="mupen64plus + RSP-HLE + GLideN64 + libretro"
PKG_LONGDESC="mupen64plus + RSP-HLE + GLideN64 + libretro."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_build_target() {
  strip_lto
}

make_target() {
  case $PROJECT in
    RPi2)
      make platform=rpi2
      ;;
    PC)
      make
      ;;
    *)
      make platform=linux-gles GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
    cp glupen64_libretro.so $INSTALL/usr/lib/libretro
}
