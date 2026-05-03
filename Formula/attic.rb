class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "1.0.0-beta.12"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "a040b6df78bf9cc7852709efa1ef95e961c51cef60aabd1687a1f7906b9152a5"

  def install
    bin.install "attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
