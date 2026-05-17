class Tang < Formula
  desc "Command-line client for Tangled"
  homepage "https://tangled.org/onev.cat/tang"
  url "https://github.com/onevcat/homebrew-tap/releases/download/tang-0.0.2/tang-0.0.2-darwin-arm64.tar.gz"
  version "0.0.2"
  sha256 "325b18dc1d098b1adc6b4a2223c152a018f0b5d924c10e94dc4b4d30b8513f6e"
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
