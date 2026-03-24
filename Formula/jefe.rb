class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.26"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.26/jefe-v0.0.26-aarch64-apple-darwin.tar.gz"
      sha256 "06273a8c6a6a1a3bba1e83e40f2c1ca552bc7d98853fc9c1c38e3e295dc6f1b8"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.26/jefe-v0.0.26-x86_64-apple-darwin.tar.gz"
      sha256 "189c30ac457c2db411efd36127279642b753098496eed65371752832f39b31ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.26/jefe-v0.0.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b95e443ca4ba6c33041a0b4fc8ab7ccde146b72b92b58dd45a07771fe62ee5a2"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.26/jefe-v0.0.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f90348c4ae5c872c86384449680dfee350f6951cca43d888e22e614a8eb262e"
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
