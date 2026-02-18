class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.6/jefe-v0.0.6-aarch64-apple-darwin.tar.gz"
      sha256 "ec02f9cce2983952fd344cffc02a68d73e68518e82bff61a0783b3f1b8a307aa"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.6/jefe-v0.0.6-x86_64-apple-darwin.tar.gz"
      sha256 "9726e12d098d7c17e6947cfa02fea7c94accc49ca35a9d171a2de3f6fb1fae6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.6/jefe-v0.0.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7468d0894414335539797f6fa0049cc20256adf29a83879e01596d94fe0616bc"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.6/jefe-v0.0.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f67d8aca1d9b2d0efc463f4389520b41b46f92f742440ca18433282bba6aa16"
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
