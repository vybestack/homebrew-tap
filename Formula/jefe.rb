class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.20"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.20/jefe-v0.0.20-aarch64-apple-darwin.tar.gz"
      sha256 "98f8158cb8574bd3b188bf8047755c7731c248e0ddc0dd3444277931c1c91f8e"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.20/jefe-v0.0.20-x86_64-apple-darwin.tar.gz"
      sha256 "4bf7a95147ea2c5e8855b3dc98d87eb0445b9e32af2859576b4367d91ba20ec4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.20/jefe-v0.0.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cbf32f16a92aed66e8d0891ae92c7eb57dbf8d884745d1d107c359b0d8b5ed4f"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.20/jefe-v0.0.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ecfe44180918b1f3a45004a8c0ce2978e1d3bf4f373f73e0d0fef5e19867f497"
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
