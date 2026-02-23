class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.11/jefe-v0.0.11-aarch64-apple-darwin.tar.gz"
      sha256 "b1171b5530baddc273b1b437aa0391826061a87cc090abcb3e2d4de9cafe9d16"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.11/jefe-v0.0.11-x86_64-apple-darwin.tar.gz"
      sha256 "fa2107531889a45cdad41258b78f1de7ea053d9415e23075d69b9a70f590bf04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.11/jefe-v0.0.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c65bcedb837c5cf3d78ba5e148e6c54eed02ed0b93abee30c72094bf27f84fb"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.11/jefe-v0.0.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8113311873ef3f531cb37e688c16ecec2dbd7a002f4098ebf344dd56d173d82"
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
