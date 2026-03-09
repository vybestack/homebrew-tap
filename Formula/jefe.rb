class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.21/jefe-v0.0.21-aarch64-apple-darwin.tar.gz"
      sha256 "860ff182d0c4cf431563c90adbb0689d5294198c0a572dafde88ca2e402c15ff"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.21/jefe-v0.0.21-x86_64-apple-darwin.tar.gz"
      sha256 "2957121ada96bb763ce213cb39649db6e138d6b65698fd5a683182d34012a3e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.21/jefe-v0.0.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a05bcf5dff870bda730943644b9e28cbd32f5c23b6e22afb08b750c76a45b2f1"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.21/jefe-v0.0.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c3c9da708fe75c8d2d09940beb619e15cfe306199639a1da0f6a287007c20e0"
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
