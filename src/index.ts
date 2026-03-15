import { parseArgs } from "node:util";
import { version } from "../package.json";

const { values } = (() => {
  try {
    return parseArgs({
      args: process.argv.slice(2),
      options: {
        name: { type: "string", short: "n", default: "World" },
        version: { type: "boolean", short: "v", default: false },
        help: { type: "boolean", short: "h", default: false },
      },
    });
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error(`Error: ${message}`);
    console.error("Run with --help for usage information.");
    process.exit(1);
  }
})();

if (values.help) {
  console.log(`greet v${version}

Usage: greet [options]

Options:
  -n, --name <name>   Name to greet (default: "World")
  -v, --version       Print version and exit
  -h, --help          Show this help message`);
  process.exit(0);
}

if (values.version) {
  console.log(`greet ${version}`);
  process.exit(0);
}

console.log(`Hello, ${values.name}!`);
