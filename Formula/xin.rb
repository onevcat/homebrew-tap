class Xin < Formula
  desc "Agent-first JMAP CLI (Fastmail-first)"
  homepage "https://github.com/onevcat/xin"
  url "https://github.com/onevcat/xin/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "11ff3c7b380910bbce042a21d3d51f5e62c8c9fb24ffe840757c6e51c4f10319"
  license "MIT"
  revision 1

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/xin-0.1.3_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "65ac025b602a45ec463fe73f143e2ebf5b4b2d32d5be80c9a47d1bafc006be6e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa38ae78bc093d470e167a9869d20b67e119afc6ddecc34977d43b9e05d3f053"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "xin", shell_output("#{bin}/xin --help")
  end
end
