class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.13/jefe-v0.0.13-aarch64-apple-darwin.tar.gz"
      sha256 "914422d414c1a5ee0eb66ff2cf3f429e53c2d20bb5b16af1f1c29bf041cb4df3"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.13/jefe-v0.0.13-x86_64-apple-darwin.tar.gz"
      sha256 "ba913e7c5eccce22a4acfad2a213f7fe9c0f93923e65931f5a65d9608d6b35b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.13/jefe-v0.0.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c15920d4f80e600fa13765763e2d6a271923cfc74c63187c70f145511e62a7f9"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.13/jefe-v0.0.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "977fc9d2429fa9fdb6b394e41d71f7702f168468817d1d4111df6b0e72e84f32"
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
