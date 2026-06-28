cask "peel" do
  version "1.1"
  sha256 "6b0ac8ac444de8b3949afb450887c5fbcd03f816cbce7c91c5c5eca767a985da"

  url "https://github.com/tijs/Peel/releases/download/v#{version}/Peel-#{version}.dmg"
  name "Peel"
  desc "Native macOS app for removing image backgrounds"
  homepage "https://github.com/tijs/Peel"

  app "Peel.app"

  zap trash: [
    "~/Library/Preferences/org.tijs.Peel.plist",
    "~/Library/Saved Application State/org.tijs.Peel.savedState",
  ]
end
