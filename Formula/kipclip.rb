class Kipclip < Formula
  desc "CLI for kipclip.com – AT Protocol bookmark manager"
  homepage "https://kipclip.com"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.4/kipclip-aarch64-apple-darwin.tar.xz"
    sha256 "488047bdc1ba334e87772002dd2772970698b3aa3ba421707b67131c80cac2e4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.4/kipclip-x86_64-apple-darwin.tar.xz"
    sha256 "54e2a3105ad35430f9ab1bd7553f2bf50da45d7320f78aefdf24e960803d72e1"
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
