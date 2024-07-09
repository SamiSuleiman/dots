#!/usr/bin/env zx

const argv = minimist(process.argv.slice(2), {
  string: ["repo"],
  alias: {
    r: "repo",
  },
});

let url = argv.repo;

if (!url) {
  echo(chalk.red("You must supply a repo url: $ sclone.mjs -r URL"));
  process.exit();
}

const homeDir = os.homedir();
let projsDir;

let name, repo;
try {
  echo(chalk.blue("Determining destination..."));
  url = url?.split("/")?.slice(-2);
  name = url[0].split(":").slice("-1")[0];
  repo = url[1].split(".")[0];

  if (!repo || !name) throw new Error();
} catch {
  echo(chalk.red("Could not determine destination. Is the URL valid?."));
  process.exit();
}

try {
  projsDir = await $`git config --get user.projects`;
} catch {
  echo(
    chalk.red(
      `Could not find user.projects in your .gitconfig, falling back to ${homeDir}.`,
    ),
  );

  projsDir = homeDir;
}

cd(projsDir);

const dest = `${projsDir}/${name}/${repo}`;

if (await fs.pathExists(dest)) {
  echo(chalk.red(`${dest} already exists!`));
  process.exit();
}

await spinner(
  chalk.blue(`Cloning repo to ${`${projsDir}/${name}/${repo}`}...`),
  () =>
    $({
      quiet: true,
    })`git clone ${argv.repo} ${name}/${repo}`,
);

echo(chalk.green(`Cloned repo to ${dest}.`));
