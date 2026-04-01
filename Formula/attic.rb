class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "1.0.0-alpha.3"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "5020f06777debb81b86df07de90951f5870f1a3af561f08ffd2660f53cf6e359"

  def install
    bin.install "attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
