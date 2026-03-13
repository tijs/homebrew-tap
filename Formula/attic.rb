class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "0.1.1"
  license "MIT"

  depends_on "tijs/tap/ladder"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6f4193fe4d3bf9ba9705b11a47409f4625db77afbf7d24af63788755540e53da"
    else
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4f91865efcd2b25ca1da26d4525d761bd986ae530d868a0c65711e79fc6664e8"
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
