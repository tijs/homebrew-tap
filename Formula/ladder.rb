class Ladder < Formula
  desc "PhotoKit export helper for iCloud Photos backup"
  homepage "https://github.com/tijs/ladder"
  version "0.3.2"
  license "Apache-2.0"

  depends_on arch: :arm64

  url "https://github.com/tijs/ladder/releases/download/v#{version}/ladder-#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "512f46c9440d8f3504597077065e066a4f6963df7b564c694fc21aff80d56153"

  def install
    bin.install "ladder-aarch64-apple-darwin" => "ladder"
  end

  test do
    assert_predicate bin/"ladder", :executable?
  end
end
