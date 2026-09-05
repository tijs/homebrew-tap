cask "kiem" do
  version "0.4.0"
  sha256 "9a2f31b0dc5720892cbf7168ca7dc51d9b448893065ecfdabe4fbedfebf0523e"

  url "https://github.com/tijs/kiem/releases/download/v#{version}/Kiem-#{version}.dmg"
  name "Kiem"
  desc "Peer-to-peer notes app with a portable Rust core"
  homepage "https://github.com/tijs/kiem"

  depends_on macos: :tahoe

  app "Kiem.app"
end
