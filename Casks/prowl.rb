cask "prowl" do
  version "2026.8.29"
  sha256 "bf236985e84a5769df76e85395abd34e568d2a0b8beb4d391014e16326dd7584"

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
