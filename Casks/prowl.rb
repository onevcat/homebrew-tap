cask "prowl" do
  version "2026.8.20"
  sha256 "561637899d04128a1e537b3e5703dca2de23c53646cf7d794ca28b019cfb79a4"

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
