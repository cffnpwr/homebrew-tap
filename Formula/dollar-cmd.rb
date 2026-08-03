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
