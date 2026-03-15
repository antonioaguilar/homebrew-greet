/**
 * Patches Formula/greet.rb with the real SHA256 hashes and version from a release.
 *
 * Reads from environment variables set by the GitHub Actions release workflow:
 *   TAG                  e.g. "v0.2.0"
 *   SHA256_MACOS_ARM64
 *   SHA256_MACOS_X64
 *   SHA256_LINUX_ARM64
 *   SHA256_LINUX_X64
 */

const tag = process.env.TAG;
if (!tag) throw new Error("Missing required env var: TAG");

const version = tag.replace(/^v/, "");

const hashes: Record<string, string | undefined> = {
  "greet-macos-arm64": process.env.SHA256_MACOS_ARM64,
  "greet-macos-x64":   process.env.SHA256_MACOS_X64,
  "greet-linux-arm64": process.env.SHA256_LINUX_ARM64,
  "greet-linux-x64":   process.env.SHA256_LINUX_X64,
};

for (const [binary, hash] of Object.entries(hashes)) {
  if (!hash) throw new Error(`Missing required env var for ${binary}`);
}

const formulaPath = "Formula/greet.rb";
let content = await Bun.file(formulaPath).text();

// Update version line
content = content.replace(/version "[^"]+"/, `version "${version}"`);

// Update each sha256 value, anchored by the url line above it.
// Matches both PLACEHOLDER strings and real hashes from prior releases.
for (const [binary, hash] of Object.entries(hashes)) {
  content = content.replace(
    new RegExp(`(url "[^"]*${binary}[^"]*"\\n      sha256 ")[^"]+(")`),
    (_match, pre, post) => `${pre}${hash}${post}`,
  );
}

await Bun.write(formulaPath, content);

console.log(`Updated Formula/greet.rb to version ${version}`);
for (const [binary, hash] of Object.entries(hashes)) {
  console.log(`  ${binary}: ${hash}`);
}
