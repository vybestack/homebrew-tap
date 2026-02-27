class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.16/jefe-v0.0.16-aarch64-apple-darwin.tar.gz"
      sha256 "ada216bd7e995346079f2bd789b8af70fef607d83ed1b02ae6b14d10baa1aef0"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.16/jefe-v0.0.16-x86_64-apple-darwin.tar.gz"
      sha256 "5c6aae36d3088dd49ad6e0e5c88db096f30780adc5805226e45e99e45565f365"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.16/jefe-v0.0.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d226951a4f53de9c6f90ea7d3b872ed5280ae1fcec30794f3fbe8ad0341a463"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.16/jefe-v0.0.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "378cc41ef8d85443027da9e9d57b6f76eec31a49df337e808f81faafd9a2c9fd"
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
