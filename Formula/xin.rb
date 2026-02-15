class Xin < Formula
  desc "Agent-first JMAP CLI (Fastmail-first)"
  homepage "https://github.com/onevcat/xin"
  url "https://github.com/onevcat/xin/archive/refs/tags/0.1.0.tar.gz"
  sha256 "0d7a4f6e9a68f1b15a705b201b437395f14dd2cab1641a45625b0a6285f70452"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "xin", shell_output("#{bin}/xin --help")
  end
end
