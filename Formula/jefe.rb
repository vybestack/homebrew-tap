class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.14/jefe-v0.0.14-aarch64-apple-darwin.tar.gz"
      sha256 "9341670ab261ad526852d5ef4bb8dc3bac83a6ef431c46ad1226c968a026c5e2"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.14/jefe-v0.0.14-x86_64-apple-darwin.tar.gz"
      sha256 "7aadd8b351f9d959db7832f9e0272bde1760b8b7104d15a265a49a194336fb56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.14/jefe-v0.0.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "566ce2bd437e324fa86c67d04148f21b236ae115652ea9335e08779ef2111363"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.14/jefe-v0.0.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0c4f017db52703feaf3c671c10ebb7b0e77a4ecdba87925c09a83771477c460"
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
