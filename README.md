# greet

A friendly CLI greeter — built with TypeScript and Bun, distributed via Homebrew.

## Install via Homebrew

```sh
brew tap antonioaguilar/greet
brew install greet
```

## Usage

```sh
greet                     # Hello, World!
greet --name Alice        # Hello, Alice!
greet -n Alice            # Hello, Alice!
greet --version           # greet 0.1.0
greet --help              # usage info
```

## Build from source

Requires [Bun](https://bun.sh) ≥ 1.0.

```sh
git clone https://github.com/antonioaguilar/homebrew-greet
cd homebrew-greet

bun install           # install dev deps (@types/bun)
bun run dev           # run without compiling
bash build.sh         # compile all 4 platform targets → dist/
```

Platform targets produced by `build.sh`:

| Binary | Platform |
|--------|----------|
| `dist/greet-macos-arm64` | macOS Apple Silicon |
| `dist/greet-macos-x64`   | macOS Intel |
| `dist/greet-linux-arm64` | Linux ARM64 |
| `dist/greet-linux-x64`   | Linux x86-64 |

## How releases work

Push a version tag and GitHub Actions takes care of the rest:

```sh
git tag v0.2.0
git push origin v0.2.0
```

The [release workflow](.github/workflows/release.yml) will:

1. Compile all 4 platform binaries via Bun
2. Compute SHA256 hashes for each binary
3. Create a GitHub Release and upload the binaries
4. Update `Formula/greet.rb` with the real hashes and new version
5. Commit and push the updated formula back to `main`

After the workflow completes, `brew upgrade greet` will pick up the new version automatically.
