class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.10/jefe-v0.0.10-aarch64-apple-darwin.tar.gz"
      sha256 "dc5d5ac5a30c99ee5dc5fb0cbf7c8287df9c439a3d986bafc8845c8edb422a6f"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.10/jefe-v0.0.10-x86_64-apple-darwin.tar.gz"
      sha256 "da3ffc07608b74b19660cb8177582c6b30aee00c0f0044903c2160516032b1b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.10/jefe-v0.0.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fdf9feea5d1f6c91ea500fa63f98849f39407150af194570d42382e99c466e8"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.10/jefe-v0.0.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca8df0f25b1935f2f342d50b6700342b6b69db4e7f7ec57b6be1612f9c6f1a22"
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
