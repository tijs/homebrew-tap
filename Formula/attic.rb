class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "1.0.0-alpha.4"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "056673741789be5f37c923265136d9ad090fff41b7fdd6a48042d01839283cef"

  def install
    bin.install "attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
