#!/bin/bash
#cmussym="lol"

function spot(){
    title=`exec playerctl metadata xesam:title`
    artist=`exec playerctl metadata xesam:artist`
    echo "$title - $artist"
}

function cmus(){
    title="$(cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3-)"
    artist="$(cmus-remote -Q 2>/dev/null | grep albumartist| cut -d " " -f 3-)"
#   album="$(cmus-remote -Q 2>/dev/null | grep album| cut -d " " -f 3-)"
    echo $title - $artist #- $album
}



if [ "$(playerctl status)" = "Playing" ]; then
  #title=`exec playerctl metadata xesam:title`
  #artist=`exec playerctl metadata xesam:artist`
  #echo "$title - $artist" 
    #echo "$(playing)"
    spotsym=""
else
    spotsym=""
fi


if pgrep "cmus" > /dev/null && [ "$(cmus-remote -Q | grep -i "status playing")" ]; then
#    echo "$(cmus)" 
    cmussym=""
else
    cmussym=""
fi

#    "echo "$(spot)"   \| "$(cmus)"
#    echo "$(cmus)" 

echo -e " $(spot)" $spotsym "\t\t" \|  "$(cmus)" $cmussym
