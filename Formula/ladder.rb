class Ladder < Formula
  desc "PhotoKit export helper for iCloud Photos backup"
  homepage "https://github.com/tijs/ladder"
  version "0.1.0"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/tijs/ladder/releases/download/v#{version}/ladder-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "PLACEHOLDER"

  def install
    bin.install "ladder-aarch64-apple-darwin" => "ladder"
  end

  test do
    assert_predicate bin/"ladder", :executable?
  end
end
