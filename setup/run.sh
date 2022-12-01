echo "Setting machine up..."

sleep 1

echo "Machine setup complete..."

curl scripts.garvin.dev/setup/zelda-chest-sound.mp3 -L -s > /tmp/success.mp3

echo "Congratulations! Closing Process..."

osascript -e 'set Volume 3' && afplay /tmp/success.mp3

say "Your machine is ready for use, sir"

echo "Goodbye"