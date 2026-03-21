class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "0.2.0"
  license "Apache-2.0"

  depends_on "tijs/tap/ladder"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "12d775a1b36114ea4540d1c8d4b0a4fc206af4b3f7885e6403b65d738026e3ab"
    else
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2fedaabc574e653c1f484a258a5378fa5b39946855011ed96a5c45ce7dd808e0"
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
