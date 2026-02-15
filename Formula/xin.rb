class Xin < Formula
  desc "Agent-first JMAP CLI (Fastmail-first)"
  homepage "https://github.com/onevcat/xin"
  url "https://github.com/onevcat/xin/archive/refs/tags/0.1.0.tar.gz"
  sha256 "0d7a4f6e9a68f1b15a705b201b437395f14dd2cab1641a45625b0a6285f70452"
  license "MIT"

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/xin-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1f64c86fbd4e66aee7835e105a7f9bd0b63a532f0f04e3ff7558bf309f3585fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d8c862a7411a1ed57492086fcb9bcd66041fccd6a6e65b37dd7a7d8b73a5e8a8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "xin", shell_output("#{bin}/xin --help")
  end
end
