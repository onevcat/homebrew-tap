class Ca < Formula
  desc "Chroma-powered cat replacement with syntax highlighting"
  homepage "https://github.com/onevcat/Chroma"
  url "https://github.com/onevcat/Chroma/archive/refs/tags/0.3.1.tar.gz"
  sha256 "16644122ab62b8b0b14c78acf66e2628db1f465f468cbe7aba3f02cfaf0346af"
  license "MIT"

  bottle do
    root_url "https://github.com/onevcat/homebrew-tap/releases/download/ca-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2e521159e9bedfcd0d60ca6234ab1b5c792c037aef1ec85657632da4f04e2e6b"
    sha256 cellar: :any_skip_relocation, sequoia:      "c76056fc5fa9c31abf788d6d5fa55b2cba5755d8f65ebec03dc4cfb17bdae1d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "289c669dcec3332d7d2dae38c25997a4625c27514243c5d51fdc833fc8ff43b1"
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
