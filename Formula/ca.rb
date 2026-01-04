class Ca < Formula
  desc "Chroma-powered cat replacement with syntax highlighting"
  homepage "https://github.com/onevcat/Chroma"
  url "https://github.com/onevcat/Chroma/archive/refs/tags/0.2.0.tar.gz"
  sha256 "1a38c1c7d9b29960ecc1701e773a03c09dfcf466768c8bbef018d988ed9f462c"
  license "MIT"

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/ca-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a90d8a4b2b3c25eefeb27373788861920eba35c63623bce5ace12e3445352c63"
    sha256 cellar: :any_skip_relocation, sequoia:      "390de6f1e346c6a52e9619c88b10250c04523c9f41235b075cc58112c60d4df0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bb6387750e224cdf3478fe75d3072c06cdd19d750ae8e4bfb62b5a69cd36d1f8"
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
