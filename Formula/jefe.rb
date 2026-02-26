class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.15/jefe-v0.0.15-aarch64-apple-darwin.tar.gz"
      sha256 "ff714cc39a30ecf4ad0b6633e4eca3bee88ff276ecc03c52fe1097450c2bbbb2"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.15/jefe-v0.0.15-x86_64-apple-darwin.tar.gz"
      sha256 "a9fe67e7a79ec11f1c30518ac4a71c4b71abfd55915cfca1212397c72a053fbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.15/jefe-v0.0.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "220d1f551f8f21463578662e90d76bd7a0ef8cdff096728a33333929a30cfc75"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.15/jefe-v0.0.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ef41f00cdf4a3d231f1ad17ca08b3029ca37a396ef088d80e13b31fefef7626"
    end
  end

  depends_on "tmux"

  def install
    bin.install "jefe"
  end

  def caveats
    <<~EOS
      jefe requires the llxprt CLI in PATH to launch agent sessions.
    EOS
  end

  test do
    assert_predicate bin/"jefe", :exist?
    assert_predicate bin/"jefe", :executable?
  end
end
