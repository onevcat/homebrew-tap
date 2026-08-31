cask "prowl" do
  version "2026.8.31"
  sha256 "4f7c075d6f11f9dea9e9fedb617608fbf66b626b1e9557847f33a8f804cb8a51"

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
