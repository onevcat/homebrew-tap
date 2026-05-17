class Tang < Formula
  desc "Command-line client for Tangled"
  homepage "https://tangled.org/onev.cat/tang"
  url "https://github.com/onevcat/homebrew-tap/releases/download/tang-0.0.3/tang-0.0.3-darwin-arm64.tar.gz"
  version "0.0.3"
  sha256 "cbcb285d58074a74d5d3215fa4adf69a34510501c37370373cb14bf6aa010875"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "tang"
    generate_completions_from_executable(bin/"tang", "completion")
  end

  test do
    assert_match "tang version #{version}", shell_output("#{bin}/tang version")
  end
end
