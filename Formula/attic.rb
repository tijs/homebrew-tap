class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "0.2.1"
  license "Apache-2.0"

  depends_on "tijs/tap/ladder"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e9b0f2e95a540eaa5554298357e245b58c3477404cb48a3cc79716515c55745d"
    else
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3c418034a98d2d17d9da9cd58d4331ad88cfa8a64a5389293c393e548ad473bb"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "attic-aarch64-apple-darwin" => "attic"
    else
      bin.install "attic-x86_64-apple-darwin" => "attic"
    end
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
