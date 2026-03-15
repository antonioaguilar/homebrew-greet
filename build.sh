#!/usr/bin/env bash
set -euo pipefail

mkdir -p dist

echo "Building greet for all platforms..."

bun build src/index.ts --compile --target=bun-darwin-arm64 --outfile dist/greet-macos-arm64
echo "  ✓ macos-arm64"

bun build src/index.ts --compile --target=bun-darwin-x64 --outfile dist/greet-macos-x64
echo "  ✓ macos-x64"

bun build src/index.ts --compile --target=bun-linux-arm64 --outfile dist/greet-linux-arm64
echo "  ✓ linux-arm64"

bun build src/index.ts --compile --target=bun-linux-x64 --outfile dist/greet-linux-x64
echo "  ✓ linux-x64"

chmod +x dist/greet-*

echo "Done. Binaries in dist/:"
ls -lh dist/
