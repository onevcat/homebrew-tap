cask "prowl" do
  version "2026.4.18"
  sha256 "9994ed5dcbc9a387a66e37ec43048e23c5c6e882c7d5e33e1a3eb6595ab44a75"

  url "https://github.com/onevcat/Prowl/releases/download/v#{version}/Prowl.dmg"
  name "Prowl"
  desc "Coding agent orchestrator"
  homepage "https://github.com/onevcat/Prowl"

  auto_updates true

  app "Prowl.app"

  zap trash: [
    "~/Library/Application Support/com.onevcat.prowl",
    "~/Library/Caches/com.onevcat.prowl",
    "~/Library/Preferences/com.onevcat.prowl.plist",
    "~/Library/Saved Application State/com.onevcat.prowl.savedState",
  ]
end
