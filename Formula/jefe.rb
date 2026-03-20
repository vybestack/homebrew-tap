class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.23"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.23/jefe-v0.0.23-aarch64-apple-darwin.tar.gz"
      sha256 "048959eeb0ad1b36ffd844bbaceac9be99580790368adcb9e59d60ccc02fd571"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.23/jefe-v0.0.23-x86_64-apple-darwin.tar.gz"
      sha256 "107fc41e659b4322909c1e90ed1ca509afed78cb7e3711372662fbeb38de4f57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.23/jefe-v0.0.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62987559970d7b0a50996f96e6f0928d6ee68af8369ae3d0c98b56c8227b072b"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.23/jefe-v0.0.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4289a5c4ced47c8e2e8791dd3bb18ce8382d884d7e50b951b8e0e52af3af7f17"
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
