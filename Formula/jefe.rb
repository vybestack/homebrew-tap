class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.22"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.22/jefe-v0.0.22-aarch64-apple-darwin.tar.gz"
      sha256 "2835dfa25c843235bbb49d69404e62335ba03097cbd319c8cdc8e4576ce0360f"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.22/jefe-v0.0.22-x86_64-apple-darwin.tar.gz"
      sha256 "b9966be397dc75715cb706b753c90efb85719126bd8b1b68bf349750b6594881"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.22/jefe-v0.0.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fee79b48bf7a0e1ed413390ec6ab4a66c2a4e4d180cd1f3672aae3b953d7819"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.22/jefe-v0.0.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "900cfc0c436479cc04f0a5f128067ad85f58c09fc15ead3146baa0fa2a7e5bed"
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
