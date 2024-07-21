#!/usr/bin/env zx

const cfgDir = await ensureCfgDir();
const cfg = await getCfg();

// init();
// await printModules();

const date = await $`date`;
await $`echo Current date is ${date}`;

async function printModules() {
  while (true) {
    echo`"huh"`;
    // const _escapedConfigString = JSON.stringify(cfg);
    // await $`sleep 1`;
    // echo`,${_escapedConfigString}`;
  }
}

function init() {
  echo`{ "version": 1 }`;
  echo`[`;
  echo`[]`;
}

async function getCfg() {
  try {
    const _cfg = await fs.readFile(cfgDir + "/config.json");
    return JSON.parse(_cfg);
  } catch (e) {
    echo`${chalk.red("Error: ", cfgDir + "/config.json not found.")}`;
    process.exit();
  }
}

async function ensureCfgDir() {
  const _cfgDir = await $`echo $XDG_CONFIG_HOME`;
  const _dir = _cfgDir + "/simple-sway-status";
  await fs.ensureDir(_dir);
  return _dir;
}
