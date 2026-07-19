class DollarCmd < Formula
  desc "Joke command that makes a pasted `$ cmd args` line just work"
  homepage "https://github.com/cffnpwr/dollar-cmd"
  url "https://github.com/cffnpwr/dollar-cmd/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "dd3a43c6134217270a098c19be0fe377466069bd857089af1ec62a4b797e8a78"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    mv bin/"dollar-cmd", bin/"$"
  end

  test do
    assert_equal "hello", shell_output("#{bin}/\\$ echo hello").strip
  end
end
