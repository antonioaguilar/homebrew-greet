class Greet < Formula
  desc "A friendly CLI greeter"
  homepage "https://github.com/antonioaguilar/homebrew-greet"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-macos-arm64"
      sha256 "9f720032a39b06e3e06564a712f9f0ae346b1b4fc010d28724259b0826b03ec1"

      def install
        bin.install "greet-macos-arm64" => "greet"
      end
    else
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-macos-x64"
      sha256 "ad3eeb7379aaf15ca8b013788908aa8e76e6fbbaebfd7555676794aedb726488"

      def install
        bin.install "greet-macos-x64" => "greet"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-linux-arm64"
      sha256 "ebe5986cef8692748b70705da25e479ab072f6527d9fc3677a91376b696d5f4b"

      def install
        bin.install "greet-linux-arm64" => "greet"
      end
    else
      url "https://github.com/antonioaguilar/homebrew-greet/releases/download/v#{version}/greet-linux-x64"
      sha256 "28167a1b07d027811cee1ee26e28a38a7a35333a96de57b6cb42db224f732fb5"

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
