class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.19"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.19/jefe-v0.0.19-aarch64-apple-darwin.tar.gz"
      sha256 "fbcd206e29687892b712cce712e48cf656acf38d92eab20ede7f286f84eb2aa2"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.19/jefe-v0.0.19-x86_64-apple-darwin.tar.gz"
      sha256 "21a32e0690c3b510f68dc73e452ed9f185a52edce0035bde22ff640403aa1d75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.19/jefe-v0.0.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83117d79a21a4ec69aeeece7f5bc73a50076393fc4c80d43a68c497a68b4bce6"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.19/jefe-v0.0.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd38546131b8dca855f4972f03779a8653b3a9e9f7ac1aaa68fa4b260bda9e7e"
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
