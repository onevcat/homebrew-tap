class Ca < Formula
  desc "Chroma-powered cat replacement with syntax highlighting"
  homepage "https://github.com/onevcat/Chroma"
  url "https://github.com/onevcat/Chroma/archive/refs/tags/0.3.1.tar.gz"
  sha256 "16644122ab62b8b0b14c78acf66e2628db1f465f468cbe7aba3f02cfaf0346af"
  license "MIT"

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/ca-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b805bf83d5b6d858c613d3d6255e397ed8d193ad6d100901cf517bc273ebfcdf"
    sha256 cellar: :any_skip_relocation, sequoia:      "644e6f3c9164330f9200294e30a2367817bd7fa5a471a91d44223126b79864a9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b091863cb1a4ead02c564daf332242b78e455bf31d61506c1f80dd8193bedc73"
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
