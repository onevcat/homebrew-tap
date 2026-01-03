class Ca < Formula
  desc "Chroma-powered cat replacement with syntax highlighting"
  homepage "https://github.com/onevcat/Chroma"
  url "https://github.com/onevcat/Chroma/archive/refs/tags/0.1.1.tar.gz"
  sha256 "59113ebd1b1ce1403b60a646760849eebe7b141eb205cfc954aa077483bc62c1"
  license "MIT"

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
