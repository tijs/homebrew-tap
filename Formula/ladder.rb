class Ladder < Formula
  desc "PhotoKit export helper for iCloud Photos backup"
  homepage "https://github.com/tijs/ladder"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tijs/ladder/releases/download/v#{version}/ladder-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/tijs/ladder/releases/download/v#{version}/ladder-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "ladder-aarch64-apple-darwin" => "ladder"
    else
      bin.install "ladder-x86_64-apple-darwin" => "ladder"
    end
  end

  test do
    # ladder reads from stdin, so just check the binary exists
    assert_predicate bin/"ladder", :executable?
  end
end
