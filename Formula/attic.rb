class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "0.2.5"
  license "Apache-2.0"

  depends_on "tijs/tap/ladder"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5e756c7caa7cbf2306adf264c36ac92310c170e770dcce4d32eaee9407887179"
    else
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "251027cc63b17bb62e272c6e8e9625fdcda6bd1d0b683194ba7d7e9cc84850e7"
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
