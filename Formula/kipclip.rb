class Kipclip < Formula
  desc "CLI for kipclip.com – AT Protocol bookmark manager"
  homepage "https://kipclip.com"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.6/kipclip-aarch64-apple-darwin.tar.xz"
    sha256 "6f9e6716a9f28deec9656f7408b606ad197875d7eeeedde1ce68b571d23fc630"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.6/kipclip-x86_64-apple-darwin.tar.xz"
    sha256 "9cb761bc05cd1d8930c7d41510ccd99ce24ae64fc8700ae5c8c7eaffc6da094d"
  else
    odie "kipclip is currently available only for macOS"
  end
  license "MIT"

  def install
    bin.install "kip"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kip --version")
  end
end
