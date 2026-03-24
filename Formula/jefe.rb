class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.25/jefe-v0.0.25-aarch64-apple-darwin.tar.gz"
      sha256 "4101e6c61d8cc6995ec0de9cc69c678457f8eb1ff0e053ab280cff74b91265f9"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.25/jefe-v0.0.25-x86_64-apple-darwin.tar.gz"
      sha256 "22f2249875a4f37489458f7088d08ce2e6df0d14d76e1b566e0185ef274e6410"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.25/jefe-v0.0.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca19ab452c709ba4572c07d30660f14259056a4cd0f5901a9982f883ee888e60"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.25/jefe-v0.0.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7bd5e6e123a358e26af4b0f3e076b964cf29a084004b5791a134f2bf7e3762f"
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
