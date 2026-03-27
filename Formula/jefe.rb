class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.27"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.27/jefe-v0.0.27-aarch64-apple-darwin.tar.gz"
      sha256 "b1ac3883b05d4dc47d8691bd5f9cef568ae7c97fcdefe502d9c3adc521f8e02a"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.27/jefe-v0.0.27-x86_64-apple-darwin.tar.gz"
      sha256 "f6ccc48c77919ab47930a1ad906531fc00958fdf64dbd4d05ec4f2ac894637f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.27/jefe-v0.0.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8a41e5889a8ef5e400b53ae3e7b4f58c47954f1fcd266b7b7df5f0dea56a925"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.27/jefe-v0.0.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "948e4ad72db8f88e448d5d9599a0556194a711302fae9de805cd3d5c6d5e94c2"
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
