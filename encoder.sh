#!/bin/bash

RES_DIR="cp866_files"
DPB_DIR="$HOME/Dropbox/Public"
mkdir -p $RES_DIR

for f in *.pp
do
    `iconv -f utf8 -t cp866 $f > $RES_DIR/$f`
done

`rm -rf "$DPB_DIR/$RES_DIR"`
`cp -r $RES_DIR $DPB_DIR`