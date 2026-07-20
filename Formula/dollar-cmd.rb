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

  bottle do
    root_url "https://ghcr.io/v2/cffnpwr/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5927c8c59c72aab30f2c24fedf5780cae08f36d63dbfc826e89d2c6f09227dcd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "90d63ea0eeaab5b9f0bd49e5a8cea1b179a6d910843e2ccfddaa61d437154252"
    sha256 cellar: :any,                 arm64_linux:   "c0743c766a8b819cbec775f4d56318c35a373032dc374582e4ef011efd73ab2a"
    sha256 cellar: :any,                 x86_64_linux:  "c4ab0e8e58ae65dc2b0c796e63defb6d256a725a2322dbd02b5e869f185cb69a"
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
