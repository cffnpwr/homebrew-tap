class DollarCmd < Formula
  desc "Joke command that makes a pasted `$`, `%` or `#` prompt line just work"
  homepage "https://github.com/cffnpwr/dollar-cmd"
  url "https://github.com/cffnpwr/dollar-cmd/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "6e5accef006fba81a51eb7fb8de28f45131ca137f5c383c009d6c8f1957c8ab4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/cffnpwr/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ba6df327904213fbc5fcd740708d7dc28af507439b861e02d1463a8adacba381"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "17a26b2865b2657b6c47e1b529f833c6f341ef81518e5f995c5e5ed41cf91b91"
    sha256 cellar: :any,                 arm64_linux:   "67d877f4bd211b85074a81cb30048878463f57b60c0eb1397139bfde63964728"
    sha256 cellar: :any,                 x86_64_linux:  "6fd5b6b592ab41fe203577ae4df64998d7f90d495f79acb7fdeea12e9d13ed0c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    mv bin/"dollar-cmd", bin/"$"
    bin.install_symlink "$" => "%"
    bin.install_symlink "$" => "#"
  end

  test do
    ["$", "%", "#"].each do |marker|
      assert_equal "hello", shell_output("'#{bin}/#{marker}' echo hello").strip
      assert_match "Usage: #{marker} ", shell_output("'#{bin}/#{marker}' --help")
    end
  end
end
