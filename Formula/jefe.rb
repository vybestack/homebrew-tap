class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.18/jefe-v0.0.18-aarch64-apple-darwin.tar.gz"
      sha256 "a1eb97e22bd72199aaf29d5cd4a9dc61b9e1022c128596690b353324c8a32e2c"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.18/jefe-v0.0.18-x86_64-apple-darwin.tar.gz"
      sha256 "c0e4cc8b3e86ec56675df4a4c8a2fb1c685060abb8941d01da564348bcd3078d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.18/jefe-v0.0.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d055536b6a619055ef5f5d217e158e1dc498beda2efe13f311996879f099ce78"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.18/jefe-v0.0.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f58a83bce01055b36dc1834f001e93b37df08680c8645a4deafd72c5f1b3f1f8"
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
