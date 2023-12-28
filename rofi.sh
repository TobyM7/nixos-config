
#!/bin/bash

# Set the directory path
theme_dir="/home/dan/.config/nix-os/themes"
# Get the list of themes
themes=($(ls "$theme_dir"))
place="/home/dan/.config/nix-os/currenttheme"
# Use rofi to display the theme options
selected_theme=$(printf "%s\n" "${themes[@]}" | rofi -dmenu -p "Select a theme:")

if [ -n "$selected_theme" ]; then
	if [ "$selected_theme" == "Random" ]; then
theme_folders=("$theme_dir"/*)

if [ ${#theme_folders[@]} -eq 0 ]; then
	echo "Error: No theme folders found in the specified directory."
	exit 1
fi

random_theme="${theme_folders[RANDOM % ${#theme_folders[@]}]}"
base=$(basename "$random_theme")
echo "$base" > $place
echo "Random script executed."
cd /home/dan/.config/nix-os/
home-manager switch --flake .#user --impure
else
	# Write the selected theme to the .currenttheme file
	echo "$selected_theme" > $place
	echo "Theme set to: $selected_theme"
cd /home/dan/.config/nix-os/
	home-manager switch --flake .#user --impure

	fi
else
	echo "No theme selected."
fi
