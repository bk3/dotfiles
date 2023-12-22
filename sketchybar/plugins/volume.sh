#!/usr/bin/env zsh

case ${INFO} in
0)
    ICON="󰝟"
    ICON_PADDING_RIGHT=6
    LABEL_DRAWING=off
    ;;
[0-9])
    ICON=""
    ICON_PADDING_RIGHT=6
    
    LABEL_DRAWING=on
    ;;
*)
    ICON=""
    ICON_PADDING_RIGHT=6
    LABEL_DRAWING=on
    ;;
esac


case ${INFO} in
    [6-9][0-9]|100)
      # ICON=$VOLUME_100
      ICON="󰕾"
      ICON_PADDING_RIGHT=10
      LABEL_DRAWING=on
      ;;
    [3-5][0-9])
      # ICON=$VOLUME_66
      ICON="󰖀"
      ICON_PADDING_RIGHT=10
      LABEL_DRAWING=on
      ;;
    [1-2][0-9])
      # ICON=$VOLUME_33
      ICON="󰖀"
      ICON_PADDING_RIGHT=10
      LABEL_DRAWING=on
      ;;
    [1-9])
      # ICON=$VOLUME_10
      ICON="󰖀"
      ICON_PADDING_RIGHT=10
      LABEL_DRAWING=on
      ;;
    0)
      ICON="󰝟"
      ICON_PADDING_RIGHT=10
      LABEL_DRAWING=off
      ;;
    *)
    ICON="󰕾"
    ICON_PADDING_RIGHT=10
    LABEL_DRAWING=off
  esac






sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label="$INFO" label.drawing="$LABEL_DRAWING"
