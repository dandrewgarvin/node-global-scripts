# Node Global Scripts

This repository contains scripts that can be globally installed with node. These are scripts that I did not want to have published through NPM.

Each script folder has run `npm init`, so it has access to anything that _does_ exist on NPM.

To create a new script, create a new folder with the name of the script you want to run. For example, there is a folder called `merge`, and that's the command that is run globally.

The folder should have an `index.js` file as the entrypoint, and that file should start with the line `#!/usr/bin/env node` to make sure node is running with that command.

The only other setup that needs to happen is to add a `"bin": "index.js",` line inside the newly created `package.json` file.

Once those things have all been done, you can write regular node code to do whatever you want! Enjoy!
