class LlxprtCode < Formula
  desc "AI-powered coding assistant CLI"
  homepage "https://github.com/vybestack/llxprt-code"
  url "https://registry.npmjs.org/@vybestack/llxprt-code/-/llxprt-code-0.9.3.tgz"
  sha256 "fd673a16c4f9706936d8f181a7ec83347d764830237f3c842ae7e21f98bc271b"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llxprt --version")
  end
end
