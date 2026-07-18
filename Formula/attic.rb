class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  url "https://github.com/tijs/attic/releases/download/v1.0.0-beta.23/attic-1.0.0-beta.23-aarch64-apple-darwin.tar.gz"
  sha256 "45de1f3d192f49981eb92112c577c1007748712c90b0c3be6a4269b6d38bf0ab"
  license "Apache-2.0"

  depends_on arch: :arm64

  def install
    bin.install "attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
