class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "1.0.0-beta.22"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "a5b647ae1f1b58a2fb22af6d76ccaae1b48c7f1119623ad51383d942c887fe32"

  def install
    bin.install "attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
