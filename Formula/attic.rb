class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "1.0.0-beta.15"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "c36786ce9175017a262093575466c170576975d90206bb1742b724135b2255fb"

  def install
    libexec.install "attic", "attic_AtticCLI.bundle"
    bin.install_symlink libexec/"attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
