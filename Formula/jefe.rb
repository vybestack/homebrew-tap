class Jefe < Formula
  desc "Terminal application for managing multiple llxprt coding agents"
  homepage "https://github.com/vybestack/llxprt-jefe"
  version "0.0.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.12/jefe-v0.0.12-aarch64-apple-darwin.tar.gz"
      sha256 "b80366d9f745c7e0314454102059b4ea9b382d5e2ec0577cfd40f3701ed7180a"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.12/jefe-v0.0.12-x86_64-apple-darwin.tar.gz"
      sha256 "11f8b45da0e4db3ee2c7ab33a87515bac48e93e26a84e7c0f6d0fff988382960"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.12/jefe-v0.0.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "905ba6de8b479851455106c7f79a7d5075d98064bace00dabd3ab5c5be718b96"
    else
      url "https://github.com/vybestack/llxprt-jefe/releases/download/v0.0.12/jefe-v0.0.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4836176aed36af00cdbce4cfb6fbbd76dff572532bae4451145274de77f5875"
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
