class Kiem < Formula
  desc "Notes, todos, and agent orchestration app"
  homepage "https://github.com/tijs/kiem"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tijs/kiem/releases/download/v0.3.1/kiem-0.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "13d80b831833996d3bdca640653bd49773cfa5c1ecd988b763b4b5e3356be962"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/tijs/kiem/releases/download/v0.3.1/kiem-0.3.1-x86_64-apple-darwin.tar.gz"
    sha256 "1b760be6a0af6208bd425b0c6bc88c2d33415c84be7bc2566c3c70d50c97f7d0"
  else
    odie "kiem is currently available only for macOS"
  end

  def install
    bin.install "kiem"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kiem --version")
  end
end
