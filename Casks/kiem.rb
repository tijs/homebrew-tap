cask "kiem" do
  version "0.4.1"
  sha256 "8811043aa644d5152bc61bdfebb736c3eb53a3009a112df34219b470a27f0d59"

  url "https://github.com/tijs/kiem/releases/download/v#{version}/Kiem-#{version}.dmg"
  name "Kiem"
  desc "Peer-to-peer notes app with a portable Rust core"
  homepage "https://github.com/tijs/kiem"

  depends_on macos: :tahoe

  app "Kiem.app"
end
