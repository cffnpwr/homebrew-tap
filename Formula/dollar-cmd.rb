class DollarCmd < Formula
  desc "Joke command that makes a pasted `$ cmd args` line just work"
  homepage "https://github.com/cffnpwr/dollar-cmd"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/cffnpwr/dollar-cmd/releases/download/v1.0.0/dollar-cmd_1.0.0_aarch64-apple-darwin.tar.gz"
      sha256 "506a2e7fd685a1c0b62dd401cf7ebe56882fe53432cc84bf28e8a3e47273ad3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cffnpwr/dollar-cmd/releases/download/v1.0.0/dollar-cmd_1.0.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d6e4bed7c0350e867cf754b4c95834fb4e150df66b5c9f9576ba3a72638b736c"
    end
    on_intel do
      url "https://github.com/cffnpwr/dollar-cmd/releases/download/v1.0.0/dollar-cmd_1.0.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2bb437f898cba23557db02b994cfe66f42b82eacbb1d6b50e78831027efd0257"
    end
  end

  def install
    bin.install "$"
  end

  test do
    assert_equal "hello", shell_output("#{bin}/\\$ echo hello").strip
  end
end
