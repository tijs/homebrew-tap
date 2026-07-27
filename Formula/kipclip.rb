class Kipclip < Formula
  desc "CLI for kipclip.com – AT Protocol bookmark manager"
  homepage "https://kipclip.com"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.3/kipclip-aarch64-apple-darwin.tar.xz"
    sha256 "97e47ff8f2d51247a993a328fa5ddfa219bdaf4dc77fd2a3684d998315d1980b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.3/kipclip-x86_64-apple-darwin.tar.xz"
    sha256 "2ad54c05876c93a53912a0c4704ebca39d9e486df6fbc80b8a32906523e2c90c"
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
