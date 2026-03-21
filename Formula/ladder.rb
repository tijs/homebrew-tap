class Ladder < Formula
  desc "PhotoKit export helper for iCloud Photos backup"
  homepage "https://github.com/tijs/ladder"
  version "0.3.3"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/ladder/releases/download/v#{version}/ladder-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "fa3c93aa16f9265e603047653dc1e0516938ffbb8bb716be3248492bd41307a1"

  def install
    bin.install "ladder-aarch64-apple-darwin" => "ladder"
  end

  test do
    assert_predicate bin/"ladder", :executable?
  end
end
