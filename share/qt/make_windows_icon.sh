#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/trpc.png
ICON_DST=../../src/qt/res/icons/trpc.ico
convert ${ICON_SRC} -resize 16x16 trpc-16.png
convert ${ICON_SRC} -resize 32x32 trpc-32.png
convert ${ICON_SRC} -resize 48x48 trpc-48.png
convert trpc-16.png trpc-32.png trpc-48.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/trpc_testnet.png
ICON_DST=../../src/qt/res/icons/trpc_testnet.ico
convert ${ICON_SRC} -resize 16x16 trpc-16.png
convert ${ICON_SRC} -resize 32x32 trpc-32.png
convert ${ICON_SRC} -resize 48x48 trpc-48.png
convert trpc-16.png trpc-32.png trpc-48.png ${ICON_DST}
rm trpc-16.png trpc-32.png trpc-48.png
#regtest
ICON_SRC=../../src/qt/res/icons/trpc_regtest.png
ICON_DST=../../src/qt/res/icons/trpc_regtest.ico
convert ${ICON_SRC} -resize 16x16 trpc-16.png
convert ${ICON_SRC} -resize 32x32 trpc-32.png
convert ${ICON_SRC} -resize 48x48 trpc-48.png
convert trpc-16.png trpc-32.png trpc-48.png ${ICON_DST}
rm trpc-16.png trpc-32.png trpc-48.png
#unittest
ICON_SRC=../../src/qt/res/icons/trpc_unittest.png
ICON_DST=../../src/qt/res/icons/trpc_unittest.ico
convert ${ICON_SRC} -resize 16x16 trpc-16.png
convert ${ICON_SRC} -resize 32x32 trpc-32.png
convert ${ICON_SRC} -resize 48x48 trpc-48.png
convert trpc-16.png trpc-32.png trpc-48.png ${ICON_DST}
rm trpc-16.png trpc-32.png trpc-48.png