DOMAIN="https://scripts.garvin.dev/setup"

# CHECK ENVIRONMENT FOR LOCAL DEV
# UPDATES DOMAIN BASED ON `-l` FLAG

while getopts ":l" opt; do
  case $opt in
    l)
      echo "Running in local development mode\n\n"
      DOMAIN="file://$PWD" # The "file://" prefix is required so that we can continue to use `curl` throughout this script
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

# CONSTANTS AND VARIABLES
MODULES="$DOMAIN/modules"
ASSETS="$DOMAIN/assets"

VOLUME="2.5"

# SETUP
echo "Setting machine up..."

sleep 2

echo "Machine setup complete..."

echo "Congratulations! Closing Process..."

curl $ASSETS/zelda-chest-sound.mp3 -L -s > /tmp/success.mp3
osascript -e "set Volume $VOLUME" && afplay /tmp/success.mp3

say "Your machine is ready for use, sir"

echo "Goodbye"

sleep 1