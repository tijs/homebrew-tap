class Ladder < Formula
  desc "PhotoKit export helper for iCloud Photos backup"
  homepage "https://github.com/tijs/ladder"
  version "0.3.4"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/ladder/releases/download/v#{version}/ladder-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "d8a45e1a30ae123523a09cf77ed0a2217f8c5fbf6ef029f4751f018d4ba2799d"

  def install
    bin.install "ladder"
  end

  test do
    assert_predicate bin/"ladder", :executable?
  end
end
