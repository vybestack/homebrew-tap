class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.7/jefe-v0.0.7-aarch64-apple-darwin.tar.gz"
      sha256 "7935ded948db1e7440ea8003216c89e77ff93425c02b1b79dc4707d6f95d8a31"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.7/jefe-v0.0.7-x86_64-apple-darwin.tar.gz"
      sha256 "7223c5acc384779dc1994cf6cbc32a42af18a4f0b38c154e9fed64043e605e22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.7/jefe-v0.0.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d18c9a77577a4660010b87e68097981bbd196313335ceed461ff9b80a378d742"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.7/jefe-v0.0.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d25e1540e449da8e4fd2c8324b6bba56b9a97521ade4f4072b95a771a0db961"
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
