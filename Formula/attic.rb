class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  url "https://github.com/tijs/attic/releases/download/v1.0.0-beta.24/attic-1.0.0-beta.24-aarch64-apple-darwin.tar.gz"
  sha256 "4d02436e63e47dfdb26f4e997130b330422bb67c3c1598f943c449b207953e34"
  license "Apache-2.0"

  depends_on arch: :arm64

  def install
    bin.install "attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
