set -e

if [ -z "$1" ]; then
	echo "No wallpaper file provided"
	exit 1
fi

ABS_IMAGE_PATH=$(realpath $1)

# make sure we are on space 1 (123 = left arrow)
osascript -e 'tell application "System Events" to key code 123 using control down'

sleep 1

# change wallpaper
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$ABS_IMAGE_PATH\" as POSIX file"

# move to space 2 (124 = right)
osascript -e 'tell application "System Events" to key code 124 using control down'

sleep 1

# change wallpaper
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$ABS_IMAGE_PATH\" as POSIX file"

#  back to space 1 (123 = left arrow)
osascript -e 'tell application "System Events" to key code 123 using control down'
