local M = {}


function M.emoji()
    hl.exec_cmd([[
        pidof rofi >/dev/null && pkill rofi

        rofimoji \
            --skin-tone neutral \
            --hidden-descriptions \
            --clipboarder wl-copy \
            --typer wtype \
            --selector-args="-theme ~/.config/rofi/custom-rofi/config-emoji.rasi"
    ]])
end


function M.keyhints()
    hl.exec_cmd(
        "~/.local/bin/keyhints"
    )
end


function M.clipboard()
    hl.exec_cmd([=[
        if pidof rofi >/dev/null; then
            pkill rofi
        fi

        tmp_dir="/tmp/cliphist"
        rm -rf "$tmp_dir"
        mkdir -p "$tmp_dir"

        generate_list() {
            cliphist list | while IFS= read -r line; do
                id="${line%%$'\t'*}"

                if [[ "$line" =~ binary.*(jpg|jpeg|png|bmp) ]]; then
                    ext="${BASH_REMATCH[1]}"
                    img_path="$tmp_dir/$id.$ext"

                    echo -e "$id\t" | cliphist decode >"$img_path" 2>/dev/null
                    echo -en "${line}\0icon\x1f${img_path}\n"

                elif [[ "$line" =~ \.png$ ]] || \
                     [[ "$line" =~ \.jpg$ ]] || \
                     [[ "$line" =~ \.jpeg$ ]]; then

                    img_path="${line#*$'\t'}"
                    img_path="${img_path## }"

                    if [[ -f "$img_path" ]]; then
                        echo -en "${line}\0icon\x1f${img_path}\n"
                    else
                        echo "$line"
                    fi
                else
                    echo "$line"
                fi
            done
        }

        while true; do
            result=$(
                generate_list | rofi -dmenu -p "📋" -i \
                    -show-icons \
                    -kb-custom-1 "Control-Delete" \
                    -kb-custom-2 "Alt-Delete" \
                    -config ~/.config/rofi/custom-rofi/config-clipboard.rasi
            )

            case "$?" in
                1)
                    exit
                    ;;
                0)
                    [[ -z "$result" ]] && continue
                    cliphist decode <<<"$result" | wl-copy
                    exit
                    ;;
                10)
                    cliphist delete <<<"$result"
                    ;;
                11)
                    cliphist wipe
                    ;;
            esac
        done
    ]=])
end


function M.search()
    hl.exec_cmd([=[
        rofi_config="$HOME/.config/rofi/custom-rofi/config-search.rasi"

        pkill -x rofi 2>/dev/null

        query=$(rofi -dmenu -config "$rofi_config" -p "")

        if [[ -n "$query" ]]; then
            encoded=$(printf '%s' "$query" | jq -sRr @uri)
            xdg-open "https://www.google.com/search?q=$encoded"
        fi
    ]=])
end


function M.app()
    hl.exec_cmd(
        "pkill rofi || rofi -show drun"
    )
end


function M.wall_picker()
    hl.exec_cmd([=[
        wallpaper_dir="$HOME/Wallpapers"
        awww_params="--transition-fps 120 --transition-type center --transition-pos bottom --transition-duration 1 --transition-bezier 0.25,0.1,0.25,1.0"

        mapfile -d "" wallpapers < <(
            find "$wallpaper_dir" -type f \
                \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) \
                -print0
        )

        if [[ ${#wallpapers[@]} -eq 0 ]]; then
            (
                action=$(notify-send \
                    -A "open=Get Wallpapers" \
                    --wait \
                    "No Wallpapers Found" \
                    "Add images to ~/Wallpapers to use dynamic theming")

                [[ "$action" == "open" ]] &&
                    xdg-open "https://github.com/caviarcbr/Wallpapers"
            ) &
            exit 1
        fi

        menu() {
            for wp in "${wallpapers[@]}"; do
                printf "%s\0icon\x1f%s\n" "$(basename "$wp")" "$wp"
            done | sort
        }

        awww query &>/dev/null || awww-daemon --format xrgb

        choice=$(
            menu | rofi -i -dmenu -p "" \
                -config ~/.config/rofi/custom-rofi/config-wallpaper.rasi
        )

        [[ -z "$choice" ]] && exit 0

        for wp in "${wallpapers[@]}"; do
            [[ "$(basename "$wp")" == "$choice" ]] || continue

            awww img "$wp" $awww_params

            mkdir -p "$HOME/.config/symphony/current"
            ln -sf "$wp" "$HOME/.config/symphony/current/wallpaper"

            notify-send -i "$wp" "Wallpaper" "${wp##*/}"
            break
        done
        '
    ]=])
end


function M.random_wallpaper()
    hl.exec_cmd([=[
        CURRENT_THEME=$(cat ~/.config/symphony/.current-theme 2>/dev/null || echo "dynamic")

        if [[ "$CURRENT_THEME" != "dynamic" ]]; then
            notify-send "Theme Locked" "Switch to Dynamic first"
            exit 0
        fi

        WALLPAPER_DIR="$HOME/Wallpapers"
        STATE_FILE="$HOME/.current_wallpaper_index"

        mapfile -t WALLPAPERS < <(
            find "$WALLPAPER_DIR" -type f \
                \( -iname "*.jpg" -o -iname "*.png" \) | sort
        )

        NUM_WALLPAPERS=${#WALLPAPERS[@]}

        if [[ "$NUM_WALLPAPERS" -eq 0 ]]; then
            (
                action=$(notify-send \
                    -A "open=Get Wallpapers" \
                    --wait \
                    "No Wallpapers Found" \
                    "Add images to ~/Wallpapers to use dynamic theming")

                [[ "$action" == "open" ]] &&
                    xdg-open "https://github.com/caviarcbr/Wallpapers"
            ) &
            exit 1
        fi

        if [[ -f "$STATE_FILE" ]]; then
            INDEX=$((RANDOM % NUM_WALLPAPERS))
            # INDEX=$((( $(<"$STATE_FILE") + 1 ) % NUM_WALLPAPERS))
        else
            INDEX=0
        fi

        echo "$INDEX" > "$STATE_FILE"

        CURRENT_WALLPAPER="${WALLPAPERS[$INDEX]}"

        awww query &>/dev/null || awww-daemon --format xrgb

        awww img "$CURRENT_WALLPAPER" \
            --transition-type center \
            --transition-pos top-right \
            --transition-fps 120 \
            --transition-duration 1 \
            --transition-bezier 0.25,0.1,0.25,1.0

        DISPLAYED_WALLPAPER=$(
            awww query |
            grep "currently displaying" |
            head -1 |
            sed "s/.*image: //"
        )

        if [[ -n "$DISPLAYED_WALLPAPER" ]]; then
            ln -sf \
                "$DISPLAYED_WALLPAPER" \
                "$HOME/symphony/themes/dynamic/wallpaper"
        fi

        matugen image "$CURRENT_WALLPAPER" \
            -m dark \
            --source-color-index=0

        "$HOME/symphony/install/themes/symphony" reload

        restart-app swayosd-server

        if pgrep -x nautilus >/dev/null; then
            pkill -x nautilus

            nautilus >/dev/null 2>&1 &
            disown
        fi

        notify-send \
            -i "$CURRENT_WALLPAPER" \
            "Dynamic" \
            "Colors from wallpaper"
        '
    ]=])
end

function M.matugen_theme()
  hl.exec_cmd([=[
    current_theme=$(cat ~/.config/symphony/.current-theme 2>/dev/null || echo "dynamic")
    if [[ "$current_theme" != "dynamic" ]]; then
      notify-send "Theme Locked" "Switch to Dynamic first"
      exit 0
    fi

    wallpaper_dir="$HOME/Wallpapers"
    awww_params="--transition-fps 120 --transition-type grow --transition-duration 1 --transition-bezier 0.25,0.1,0.25,1.0 --transition-pos top-right"

    mapfile -d '' wallpapers < <(find "$wallpaper_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -print0)

    if [[ ${#wallpapers[@]} -eq 0 ]]; then
      (action=$(notify-send -A "open=Get Wallpapers" --wait "No Wallpapers Found" "Add images to ~/Wallpapers to use dynamic theming") && [[ "$action" == "open" ]] && xdg-open "https://github.com/caviarcbr/Wallpapers") &
      exit 1
    fi
    menu() {
      for wp in "${wallpapers[@]}"; do
        name=$(basename "$wp")
        printf "%s\x00icon\x1f%s\n" "$name" "$wp"
      done | sort
    }

    awww query &>/dev/null || awww-daemon --format xrgb

    choice=$(menu | rofi -i -dmenu -p "" -config ~/.config/rofi/custom-rofi/config-wallpaper.rasi)
    [[ -z "$choice" ]] && exit 0
    for wp in "${wallpapers[@]}"; do
      if [[ "$(basename "$wp")" == "$choice" ]]; then
        awww img "$wp" $awww_params
        matugen image "$wp" -m dark --source-color-index=0

        # update wallpaper symlink for hyprlock
        mkdir -p "$HOME/.config/symphony/current"
        ln -sf "$wp" "$HOME/.config/symphony/current/wallpaper"

        "$HOME/symphony/install/themes/symphony" reload
        restart-app swayosd-server

        # nautilus needs full restart to pick up new gtk theme
        pgrep -x nautilus >/dev/null && (
          pkill -x nautilus
          nautilus &>/dev/null &
        )

        notify-send -i "$wp" "Dynamic" "Colors from wallpaper"
        break
      fi
    done

  ]=])
end


return M
