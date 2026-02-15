class Xin < Formula
  desc "Agent-first JMAP CLI (Fastmail-first)"
  homepage "https://github.com/onevcat/xin"
  url "https://github.com/onevcat/xin/archive/refs/tags/0.1.1.tar.gz"
  sha256 "6460a94871932520697de0e4ea0457374b58f98b4ab8509d9a088eeba3ccd3ca"
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
