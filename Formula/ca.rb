class Ca < Formula
  desc "Chroma-powered cat replacement with syntax highlighting"
  homepage "https://github.com/onevcat/Chroma"
  url "https://github.com/onevcat/Chroma/archive/refs/tags/0.1.1.tar.gz"
  sha256 "59113ebd1b1ce1403b60a646760849eebe7b141eb205cfc954aa077483bc62c1"
  license "MIT"

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/ca-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cbb876d3904ef5a22293755b5ab07773b6d1f9eb6bf239ce0ec0ae88e0dbd900"
    sha256 cellar: :any_skip_relocation, sequoia:      "7d2c9fdcb1bcece56b1c17f0f45785096f29576c008dfbe14533805cea2f219b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "49a729dc63c477c174b416f74e36f62ee76ce097bd2640031aaf1e6c0772a7be"
  end

  on_macos do
    depends_on xcode: ["26.0", :build] if Hardware::CPU.intel?
    depends_on macos: :sequoia
  end

  on_linux do
    depends_on "swift" => :build
  end

  def install
    args = ["-c", "release", "--disable-sandbox", "--product", "ca"]
    args << "--static-swift-stdlib" if OS.linux?
    system "swift", "build", *args
    bin.install ".build/release/ca"
  end

  test do
    assert_match "ca", shell_output("#{bin}/ca --help")
  end
end
