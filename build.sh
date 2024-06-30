#!/bin/bash
mkdir -pv targets
while IFS= read -r target; do
    cd "$target"
    echo "Processing target: $target"

    if [ -d src/$target ]; then
        rm -rf src/$target
    fi

    if [ -e $targer*.zst ]; then
        rm -f $targer*.zst
    fi

    makepkg -cfs --noconfirm --rmdeps

    mv *.pkg.tar.zst ../targets/

    rm -rf $target

    cd ..
done < pkgs