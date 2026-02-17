class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.2/jefe-v0.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "7f72165490176bb96adfdf2a283254279648b58e0550b417bb88834210cfdc8c"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.2/jefe-v0.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "e9391eddf39b160461d1a98ee6e926e42d0c2e8ec89da32bd38ea4b07cb7c5e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.2/jefe-v0.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d196bd3f61ec90118432aeede98b142e04cd2b4ca032daaf412a907fb5714495"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.2/jefe-v0.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26088dc59f937e64e12de65a40a5bb0c7780461495601752b0d9dd8a6a25a613"
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
