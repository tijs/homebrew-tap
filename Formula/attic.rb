class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "1.0.0-beta.20"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "a221d0bb9fd5b38ac05f4873e43677737b07995e698c7a8e758903269fc258e4"

  def install
    bin.install "attic"
  end

  test do
    assert_match "attic", shell_output("#{bin}/attic --help")
  end
end
