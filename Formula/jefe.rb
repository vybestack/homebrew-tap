class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.9/jefe-v0.0.9-aarch64-apple-darwin.tar.gz"
      sha256 "c06fe25a804c26824fd0df404088b08b5d41958102bd6eff838fe2ba752a2d9d"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.9/jefe-v0.0.9-x86_64-apple-darwin.tar.gz"
      sha256 "3d8cb440fb6bdae1fa00103c4bd12c73c81540c15cad8244f200aea23f9d13ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.9/jefe-v0.0.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1b1316649c727e1092d95992c2d8526bb669e0e618a6a1fb7b3f57409dbc249"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.9/jefe-v0.0.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ad9d21ac1d25e74fa86ff1076e23ea0b5953db3c2181c92915358f851caca54"
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
