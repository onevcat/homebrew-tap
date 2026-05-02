class Tang < Formula
  desc "Command-line client for Tangled"
  homepage "https://tangled.org/onev.cat/tang"
  url "https://github.com/onevcat/homebrew-tap/releases/download/tang-0.0.1/tang-0.0.1-darwin-arm64.tar.gz"
  version "0.0.1"
  sha256 "d1960791d4d7a0296eea32cef3bfb62b06f59f0cfaf84ab89dcf31402687af77"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  def install
    bin.install "tang"
    generate_completions_from_executable(bin/"tang", "completion")
  end

  test do
    assert_match "tang version #{version}", shell_output("#{bin}/tang version")
  end
end
