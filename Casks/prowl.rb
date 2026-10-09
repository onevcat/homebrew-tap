cask "prowl" do
  version "2026.10.10"
  sha256 "2381073d42ba0e9aa61f70f72d22757a20a1e97c92fcf42f03d867b994e44dd0"

  url "https://github.com/onevcat/Prowl/releases/download/v#{version}/Prowl.dmg"
  name "Prowl"
  desc "Coding agent orchestrator"
  homepage "https://github.com/onevcat/Prowl"

  auto_updates true
  depends_on :macos

  app "Prowl.app"

  zap trash: [
    "~/Library/Application Support/com.onevcat.prowl",
    "~/Library/Caches/com.onevcat.prowl",
    "~/Library/Preferences/com.onevcat.prowl.plist",
    "~/Library/Saved Application State/com.onevcat.prowl.savedState",
  ]
end
