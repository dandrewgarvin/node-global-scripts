DIRECTORY=$(echo $@ | cut -c 8-)

echo -e '\n\nInstalling Browsers...'

brew bundle --file="$DIRECTORY/Brewfile"

# Install Ghostlab
curl https://www.vanamco.com/Ghostlab3.dmg -sL

echo -e 'Browsers Installed!\n\n'