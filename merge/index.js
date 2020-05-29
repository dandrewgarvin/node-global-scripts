#!/usr/bin/env node

/**
 * @name merge
 * @version 1.0.0
 * @timestamp 05.05.2020 16:35:00
 * @author Andrew Garvin /me@andrewgarv.in)/ (https://andrewgarv.in)
 *
 * @param {BranchName} process.argv[2] is the name of the branch you want to merge content from
 *
 * @example merge dev
 * @example merge master
 *
 * @description This script will checkout to the branch you've passed in, pull any remote changes, checkout to your original branch, and merge those changes. The user will need to resolve any conflicts that happen as part of the merge.
 */

const { exec } = require("child_process");
const { program } = require("commander");

if (!process.argv[2]) {
  console.log("Please pass in the branch name you want to merge from.");

  process.exit(127);
}

program
  .usage("<name of branch to merge from>")
  .option("-n, --new <name>", "Name the new branch")
  .option("-c, --checkout <name>", "checkout to a branch other than current");

program.parse(process.argv);

execPromise("git branch").then(async (result) => {
  let currentBranch = result.split("\n").find((line) => line.match(/\*./g));

  if (program.checkout) {
    let checkout = result
      .split("\n")
      .map((line) => line.trim())
      .find((line) => line.match(program.checkout));

    if (!checkout) {
      console.log("Unable to parse checkout branch. Try again later.");

      process.exit(127);
    }
  }

  if (!currentBranch) {
    console.log("Unable to parse current branch. Try again later.");

    process.exit(127);
  }

  currentBranch = currentBranch.replace("* ", "");

  const mergeBranch = process.argv[2];

  console.log("checking out...");
  await execPromise(`git checkout ${mergeBranch}`);

  console.log("pulling code...");
  const pull = await execPromise("git pull");
  console.log(pull);

  if (program.new) {
    console.log(`switching to new branch: ${program.new}...`);
    await execPromise(`git switch -c ${program.new}`);
  } else if (program.checkout) {
    console.log(`checking out to ${program.checkout}...`);
    await execPromise(`git checkout ${program.checkout}`);
  } else {
    console.log("checking back in...");
    await execPromise(`git checkout ${currentBranch}`);
  }

  await execPromise(`git merge ${mergeBranch}`);
  console.log(`successfully merged from ${mergeBranch} into ${currentBranch}`);

  process.exit(0);
});

function execPromise(cmd) {
  return new Promise((resolve) => {
    exec(cmd, (err, stdout, stderr) => {
      if (err) {
        console.log(
          `Unable to process. Try again later. ERROR: ${err || stderr}`
        );

        process.exit(127);
      }

      resolve(stdout);
    });
  });
}
