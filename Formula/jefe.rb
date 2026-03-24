class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.24"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.24/jefe-v0.0.24-aarch64-apple-darwin.tar.gz"
      sha256 "b2f4b749b030216cefb412cb97cf886d2dfbb8adec8a2b41a24bab1c49adb340"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.24/jefe-v0.0.24-x86_64-apple-darwin.tar.gz"
      sha256 "4ca33cd57933c23537f2b12e0c57a315380962ea270ff38e05d6b72e4f7eb3b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.24/jefe-v0.0.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "245fd4c89e31f400a8de10f6377212d3b3776d8492e264656aed3ef981dcf83a"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.24/jefe-v0.0.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c7daebe439289c41344c55207278da8a822b86a7a8dd6deff16c432754a90ad"
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
