class Kipclip < Formula
  desc "CLI for kipclip.com – AT Protocol bookmark manager"
  homepage "https://kipclip.com"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.5/kipclip-aarch64-apple-darwin.tar.xz"
    sha256 "796d09ef24882f10781d7b51ff691bbb7345a9b7ddbaa4b11bf82ce788bbf3f8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.5/kipclip-x86_64-apple-darwin.tar.xz"
    sha256 "4916e5f764712c3edb094fc6d3856c58eab56d0996b61e51ea55d356793c12ce"
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
