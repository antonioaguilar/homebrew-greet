class Greet < Formula
  desc "A friendly CLI greeter"
  homepage "https://github.com/antonioaguilar/homebrew-greet"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-macos-arm64"
      sha256 "PLACEHOLDER_SHA256_MACOS_ARM64"

      def install
        bin.install "greet-macos-arm64" => "greet"
      end
    else
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-macos-x64"
      sha256 "PLACEHOLDER_SHA256_MACOS_X64"

      def install
        bin.install "greet-macos-x64" => "greet"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-linux-arm64"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"

      def install
        bin.install "greet-linux-arm64" => "greet"
      end
    else
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-linux-x64"
      sha256 "PLACEHOLDER_SHA256_LINUX_X64"

      def install
        bin.install "greet-linux-x64" => "greet"
      end
    end
  end

  test do
    assert_match "Hello, World!", shell_output("#{bin}/greet")
    assert_match "greet #{version}", shell_output("#{bin}/greet --version")
  end
end
