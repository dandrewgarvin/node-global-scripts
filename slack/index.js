#!/usr/bin/env node

const robot = require("robotjs");

const sleep = (ms) => new Promise((res) => setTimeout(res, ms));

const receiver = process.argv[2];
const message = process.argv.slice(3).join(" ");

async function start() {
  const screen = robot.getScreenSize();

  // open slack
  robot.keyTap("space", "command");
  await sleep(1000);

  robot.keyTap("s");
  await sleep(100);
  robot.keyTap("l");
  await sleep(100);
  robot.keyTap("a");
  await sleep(100);
  robot.keyTap("c");
  await sleep(100);
  robot.keyTap("k");
  await sleep(100);
  robot.keyTap("enter");

  // focus receiver
  await sleep(1000);
  robot.keyTap("k", "command");
  await sleep(100);

  receiver.split("").forEach(async (e, i) => {
    await sleep(100 * i);
    robot.keyTap(e);
  });

  await sleep(receiver.length * 200);
  robot.keyTap('enter');

  // type and send message
  await sleep(500);
  robot.typeStringDelayed(message, 1000);
  await sleep(500);
  robot.keyTap('enter');
}

start();
