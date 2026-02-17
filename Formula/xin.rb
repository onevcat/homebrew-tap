class Xin < Formula
  desc "Agent-first JMAP CLI (Fastmail-first)"
  homepage "https://github.com/onevcat/xin"
  url "https://github.com/onevcat/xin/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "11ff3c7b380910bbce042a21d3d51f5e62c8c9fb24ffe840757c6e51c4f10319"
  license "MIT"

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/xin-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c0251465afa39029c49836e7f22ee522b2ca8ae962603e011742e59da63a9978"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9fdb60de3aa809f657979a5554bd69dea3a03938b5c124ca887b565b98e3b848"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "xin", shell_output("#{bin}/xin --help")
  end
end
