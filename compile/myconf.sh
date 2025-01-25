#!/bin/sh
set -e

./configure \
--with-native-compilation \
--with-pgtk \
--with-cairo \
--with-modules \
--with-harfbuzz \
--with-compress-install \
--with-threads \
--with-included-regex \
--with-zlib \
--without-xaw3d \
--with-mailutils \
--with-tree-sitter \
--without-x \
-prefix=/usr/local
