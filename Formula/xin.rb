class Xin < Formula
  desc "Agent-first JMAP CLI (Fastmail-first)"
  homepage "https://github.com/onevcat/xin"
  url "https://github.com/onevcat/xin/archive/refs/tags/0.1.1.tar.gz"
  sha256 "6460a94871932520697de0e4ea0457374b58f98b4ab8509d9a088eeba3ccd3ca"
  license "MIT"

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/xin-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ad8d8f98b390f64b542d0f4ae8ee34e6fcde357a64d3d076b68e41fd1d4068df"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "beaacc07fdcc008a9b738c51065e8ce46132b4d14aebbd625fa75fa8f744ba4c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "xin", shell_output("#{bin}/xin --help")
  end
end
