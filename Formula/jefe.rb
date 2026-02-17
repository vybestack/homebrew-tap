class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.5/jefe-v0.0.5-aarch64-apple-darwin.tar.gz"
      sha256 "0aa10785119e48b3b40cb794946654ab6bfe491a66ac468e3e016cf6a566ff3e"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.5/jefe-v0.0.5-x86_64-apple-darwin.tar.gz"
      sha256 "c9ab88a63f695fe380fd10a3f15643fe196bcb3ec722534efd1e2c6443dc7413"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.5/jefe-v0.0.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "277caf582575925059a976346fc217727e85c259244fc25eadec58abe379497c"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.5/jefe-v0.0.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63352b9c8ea83237ba68f0a79a5d513fc8f8b38186497ccf53896b5a1e72b54d"
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
