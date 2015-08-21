set $Super Mod4
set $mod Mod1
font xft:DejaVu Sans Mono 10

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod+

# start a terminal
bindsym $mod+Return exec urxvt

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run
#bindsym $mod+d exec --no-startup-id j4-dmenu-desktop --dmenu="dmenu -i -nb '#2C3E50' -fn 'DejaVu Sans Mono 10'"


# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+oslash focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+oslash move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+Shift+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace $WS1
bindsym $mod+2 workspace $WS2
bindsym $mod+3 workspace $WS3
bindsym $mod+4 workspace $WS4
bindsym $mod+5 workspace $WS5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

set $WS1 1:$
set $WS2 2:@
set $WS3 3:♪
set $WS4 4
set $WS5 5


# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $WS1
bindsym $mod+Shift+2 move container to workspace $WS2
bindsym $mod+Shift+3 move container to workspace $WS3
bindsym $mod+Shift+4 move container to workspace $WS4
bindsym $mod+Shift+5 move container to workspace $WS5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10


###hotkeys###
# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym oslash resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}



set $back #2C3E50
set $text #e0e0e0
set $blue #95A5A6
set $red #E74C3C
set $blue #729FCF
set $back2 #34495E
set $orange #E67E22

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
#        tray_output primary
strip_workspace_numbers yes
        font xft:DejaVu Sans Mono 11
#        status_command i3blocks
        position top
        colors {
            background $back 
            #statusline $text
            #separator $text
            # colors           border  background  text
            focused_workspace  $blue     $blue    $back
            inactive_workspace $back     $back    $text
            active_workspace   $back     $back      $text
            urgent_workspace   #990000   #990000    #ffffff
        }
}


# new window default border
new_window pixel 1
new_float pixel 0
# border colors			border		background		text		indicator
client.focused          $blue      $blue        #ffffff         $orange
client.unfocused        $back2 $back2 $back2 $back2 
#client.urgent           #990000      #990000        #ffffff     #990000
client.focused_inactive $back2  $back2 $back2 $back2

#gaps inner 5

#smart_borders on
workspace_auto_back_and_forth yes

###asssign to workspace###
assign [class="^Spotify$"] $WS3
assign [class="^Google-chrome-stable$"] $WS2
assign [class="^Deluge$"] $WS4


###hotkeys###
bindsym $mod+r mode "resize"
bindsym $mod+x [urgent=latest] focus
bindsym $mod+m move workspace to output left
bindsym $mod+Shift+m move workspace to output right
bindsym $Super+l exec i3lock -c 2C3E50
bindsym $Super+Shift+3 exec scrot

######MUSIC######
bindsym Control+bar exec cmus-remote -u
bindsym $mod+c exec cmus-remote -u
bindsym $mod+b exec cmus-remote -n
bindsym $mod+z exec cmus-remote -r
bindsym $Super+oslash exec --no-startup-id "amixer -R set Master 3%- ; pkill -SIGRTMIN+10 i3blocks" 
bindsym $Super+ae exec --no-startup-id "amixer -R set Master 3%+  ; pkill -SIGRTMIN+10 i3blocks"

bindsym XF86AudioLowerVolume exec --no-startup-id "amixer -R set Master 3%- ; pkill -SIGRTMIN+10 i3blocks" 
bindsym XF86AudioRaiseVolume exec --no-startup-id "amixer -R set Master 3%+ ; pkill -SIGRTMIN+10 i3blocks"
#bindsym XF86AudioLowerVolume exec --no-startup-id "pactl set-sink-volume 0 3%- ; pkill -SIGRTMIN+10 i3blocks" 
#bindsym XF86AudioRaiseVolume exec --no-startup-id "pactl set-sink-volume 0 3%+ ; pkill -SIGRTMIN+10 i3blocks"
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
bindsym XF86AudioStop exec playerctl stop
bindsym XF86AudioMute exec --no-startup-id "amixer set Master 0 ; pkill -SIGRTMIN+10 i3blocks"  
bindsym XF86MonBrightnessDown exec xbacklight -dec 5
bindsym $mod+XF86MonBrightnessDown exec xbacklight -dec 1 
bindsym XF86MonBrightnessUp exec xbacklight -inc 5
bindsym XF86KbdBrightnessDown exec kbdlight down 10
bindsym XF86KbdBrightnessUp exec kbdlight up 10

####LAUNCH###
exec xsetroot -solid "#2C3E50"
#exec connman-ui-gtk
