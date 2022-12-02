LOCAL=false
DOMAIN="https://scripts.garvin.dev/setup"

## UTILS

run_script() {
  DIRECTORY="$1"

  if ($LOCAL); then
    DIRECTORY=$(echo $DIRECTORY | cut -c 8-)
  fi
  
  # strip file from path so module can use `path` variable to use local Brewfile
  DIRECTORY=$(echo $DIRECTORY | rev | cut -d'/' -f2- | rev)

  curl -sL $1 | bash -s -- --path="$DIRECTORY"
}

# CHECK ENVIRONMENT FOR LOCAL DEV
# UPDATES DOMAIN BASED ON `-l` FLAG

while getopts ":l" opt; do
  case $opt in
    l)
      echo "Running in local development mode\n\n"
      DOMAIN="file://$PWD" # The "file://" prefix is required so that we can continue to use `curl` throughout this script
      LOCAL=true
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

## Install Homebrew
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew Installed!"
fi

## Install Modules
echo "Setting machine up..."

### API Clients

### Browsers
run_script $MODULES/browsers/run.sh

### Communication

### Containers

### Database

### Design Tools

### Fonts

### IDE

### Languages

### Media

### Privacy


echo "Machine setup complete..."

echo "Congratulations! Closing Process..."

curl $ASSETS/zelda-chest-sound.mp3 -L -s > /tmp/success.mp3
osascript -e "set Volume $VOLUME" && afplay /tmp/success.mp3

say "Your machine is ready for use, sir"

echo "Goodbye"

sleep 1