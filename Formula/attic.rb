class Attic < Formula
  desc "Back up and restore your iCloud Photos library"
  homepage "https://github.com/tijs/attic"
  url "https://github.com/tijs/attic/releases/download/v1.0.0-beta.25/attic-1.0.0-beta.25-aarch64-apple-darwin.tar.gz"
  sha256 "de773beaae74808468142e076cf6f304e9d5a10b91ec2c294e1e20e98e44b096"
  license "Apache-2.0"

  depends_on arch: :arm64

  def install
    bin.install "attic"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/attic --version")
    assert_match "attic backup", shell_output("#{bin}/attic backup --help")
    assert_match "attic restore", shell_output("#{bin}/attic restore --help")
  end
end
