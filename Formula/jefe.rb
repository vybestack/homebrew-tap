class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.8/jefe-v0.0.8-aarch64-apple-darwin.tar.gz"
      sha256 "c1102b94645ba6485254a15bd391ab05bf57880ad4e115c1c1157456ccf98d16"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.8/jefe-v0.0.8-x86_64-apple-darwin.tar.gz"
      sha256 "1ed28e12d2845962e56ee54bb5f55d73eae749992e12db8d1807792f968d07ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.8/jefe-v0.0.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5be0731cbe9897ede3c7b17df81724d79356e0257302cffb0893b4758de97f4e"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.8/jefe-v0.0.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef09ba339b16e1a0c163b6263b17c8f07dc4f3f9ab79280236504f3ea251bd1c"
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
