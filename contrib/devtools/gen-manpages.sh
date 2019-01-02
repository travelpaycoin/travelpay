#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

TRPCD=${TRPCD:-$BINDIR/trpcd}
TRPCCLI=${TRPCCLI:-$BINDIR/trpc-cli}
TRPCTX=${TRPCTX:-$BINDIR/trpc-tx}
TRPCQT=${TRPCQT:-$BINDIR/qt/trpc-qt}

[ ! -x $TRPCD ] && echo "$TRPCD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
TRPCVER=($($TRPCCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for trpcd if --version-string is not set,
# but has different outcomes for trpc-qt and trpc-cli.
echo "[COPYRIGHT]" > footer.h2m
$TRPCD --version | sed -n '1!p' >> footer.h2m

for cmd in $TRPCD $TRPCCLI $TRPCTX $TRPCQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${TRPCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${TRPCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
