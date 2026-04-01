pkgs:
pkgs.writeShellApplication {
  name = "hyprland-extension-resize";
  runtimeInputs = with pkgs; [
    socat
    jq
    ripgrep
  ];
  checkPhase = "";
  text = ''
    handle() {
      case $1 in
        windowtitle*)
          # Extract the window ID from the line
          window_id=''${1#*>>}

          # Fetch the list of windows and parse it using jq to find the window by its decimal ID
          window_info=$(hyprctl clients -j | jq --arg id "0x$window_id" '.[] | select(.address == ($id))')

          # Extract the title from the window info
          window_title=$(echo "$window_info" | jq '.title')

          # Check if the title matches the characteristics of the Bitwarden popup window
          if [[ "$(echo "$window_title" | rg " *Extension.*")" != "" ]]; then
            echo "$window_id", "$window_title"
            hyprctl --batch "dispatch focuswindow address:0x$window_id; dispatch setfloating address:0x$window_id ; dispatch resizewindowpixel exact 400 600,address:0x$window_id ; dispatch centerwindow address:0x$window_id"
          fi
          ;;
      esac
    }

    # Listen to the Hyprland socket for events and process each line with the handle function
    socat -U - "UNIX-CONNECT:/$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
  '';
}
