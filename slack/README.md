# Slack

This script allows you to send slack messages to users via the terminal.

It's very fragile in it's current state, but it's fun to play with, and was built to mess around with UI automation via robotjs.

Current caveats:
- slack must be running
- you must have the current workspace focused that has the user you are sending the message to
- if you want to type multiple words as the recipients name (ie Andrew Garvin) you must do it in quotation marks ("andrew garvin"). If you are just typing their first name, you do not need quotes
- recipient name *must* be lowercase

## Usage

After installing the script via `npm i -g .`, you can send a message like so:
- `slack me hello world`
- `slack brennon this is a test message to see how this automated thing works`
- `slack "andrew garvin" "+:heart:"`
- `slack andrew woooooooooooooooooow`