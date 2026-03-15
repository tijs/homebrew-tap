class Attic < Formula
  desc "Back up your iCloud Photos library to S3-compatible storage"
  homepage "https://github.com/tijs/attic"
  version "0.1.6"
  license "Apache-2.0"

  depends_on "tijs/tap/ladder"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "154da86b63fe45430144b5318bc49741f46fe5717d5858437a027aedeab7308e"
    else
      url "https://github.com/tijs/attic/releases/download/v#{version}/attic-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7e7da442289491e1fdfea71a2ed412d2e79d2f0e5685671937117ce8c1cce509"
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
