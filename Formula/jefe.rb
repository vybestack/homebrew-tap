class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.3/jefe-v0.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "bb3f191e114be67d7ec92785ae2635a22b0ceeb6e7fe1fbdbefcf8a960980acc"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.3/jefe-v0.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "7750c4af810de66104c09451f30c67d9aed60ba870e911a8177ce62794fb55d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.3/jefe-v0.0.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "120b75ec3818c023bd20bf24900d62c519559ce56af9798f3a5ed009fa481e74"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.3/jefe-v0.0.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0a5a6bc5a45a9af81fad824fce03027cabcc510d27efaec12214256c01678a4"
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
