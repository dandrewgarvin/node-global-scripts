DIRECTORY=$(echo $@ | cut -c 8-)

echo -e '\n\nInstalling Browsers...'

curl -sL $DIRECTORY/Brewfile -o /tmp/Brewfile

brew bundle --file=/tmp/Brewfile

# Install Ghostlab
curl https://www.vanamco.com/Ghostlab3.dmg -sL

echo -e 'Browsers Installed!\n\n'