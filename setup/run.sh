echo "Setting machine up..."

wait 1

echo "Machine setup complete..."

curl scripts.garvin.dev/setup/zelda-chest-sound.mp3 -L > /tmp/success.mp3

echo "Congratulations! Closing Process..."

afplay /tmp/success.mp3

say "Your machine is ready for use, sir"

echo "Goodbye"