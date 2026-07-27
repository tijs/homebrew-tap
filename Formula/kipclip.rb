class Kipclip < Formula
  desc "CLI for kipclip.com – AT Protocol bookmark manager"
  homepage "https://kipclip.com"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.3/kipclip-aarch64-apple-darwin.tar.xz"
      sha256 "97e47ff8f2d51247a993a328fa5ddfa219bdaf4dc77fd2a3684d998315d1980b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tijs/kipclip-cli/releases/download/v0.1.3/kipclip-x86_64-apple-darwin.tar.xz"
      sha256 "2ad54c05876c93a53912a0c4704ebca39d9e486df6fbc80b8a32906523e2c90c"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "x86_64-apple-darwin": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "kip"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "kip"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
