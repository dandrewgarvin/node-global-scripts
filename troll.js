const robot = require('robotjs');

const TROLLS = [
  // freeze mouse
  () => {
    const START_TIME = new Date();
    const END_TIME = new Date(START_TIME.getTime() + 5000);

    const screen_width = robot.getScreenSize().width;
    const screen_height = robot.getScreenSize().height;

    while (new Date() < END_TIME) {
      robot.moveMouse(screen_width / 2, screen_height / 2)
    }
  },
  // select everything
  () => {
    setTimeout(() => {
      robot.keyTap('a', 'command');
    }, 1500);
  },
  // mute audio
  () => {
    setTimeout(() => {
      robot.keyTap('audio_mute');
    }, 1500);
  },
];

const troll = TROLLS[Math.floor(Math.random() * TROLLS.length)];

troll();
