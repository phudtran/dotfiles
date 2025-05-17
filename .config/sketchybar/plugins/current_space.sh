#!/usr/bin/env zsh

echo "[DEBUG] SENDER=$SENDER, INFO=$INFO, NAME=$NAME SPACE=$FOCUSED_WORKSPACE" >> /tmp/sketchybar_debug.log

update_space() {
    case "$FOCUSED_WORKSPACE" in
        1)
            ICON="󰅶"
            ICON_PADDING_LEFT=7
            ICON_PADDING_RIGHT=7
            ;;
        *)
            ICON="$FOCUSED_WORKSPACE"
            ICON_PADDING_LEFT=9
            ICON_PADDING_RIGHT=10
            ;;
    esac

    sketchybar --set "$NAME" \
        icon="$ICON" \
        icon.padding_left="$ICON_PADDING_LEFT" \
        icon.padding_right="$ICON_PADDING_RIGHT"
}

case "$SENDER" in
    "mouse.clicked")
        sketchybar --remove '/.*/'
        source "$HOME/.config/sketchybar/sketchybarrc"
        ;;
    *)
        update_space "$INFO"
        ;;
esac
