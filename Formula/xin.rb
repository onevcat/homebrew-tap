class Xin < Formula
  desc "Agent-first JMAP CLI (Fastmail-first)"
  homepage "https://github.com/onevcat/xin"
  url "https://github.com/onevcat/xin/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "11ff3c7b380910bbce042a21d3d51f5e62c8c9fb24ffe840757c6e51c4f10319"
  license "MIT"


  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "xin", shell_output("#{bin}/xin --help")
  end
end
