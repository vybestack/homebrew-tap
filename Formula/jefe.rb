class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.17/jefe-v0.0.17-aarch64-apple-darwin.tar.gz"
      sha256 "00723633ca43a12f601bcc94b07a57e39e64c1388ce4e50fc8262c7b38a6778d"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.17/jefe-v0.0.17-x86_64-apple-darwin.tar.gz"
      sha256 "9141464321f6bea9e00f1b15dc2e38835df0a9c3b11472d0c07d6b8202cf0831"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.17/jefe-v0.0.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31cba5e5f0be784c7c5635246cdc0724503435a285e8cc3d470c54fe758b7dc0"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.17/jefe-v0.0.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "089572ce668fca8c3243284df246983bb314c3339989a9c7d99ca5f05b8fb726"
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
