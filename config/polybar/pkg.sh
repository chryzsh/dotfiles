#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#585858}%{F-} $aur"
else
    #echo "$pac %{F#5b5b5b}%{F-} $aur"
    echo "$pac %{F#585858}%{F-} $aur"
fi
