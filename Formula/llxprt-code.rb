class LlxprtCode < Formula
  desc "AI-powered coding assistant CLI"
  homepage "https://github.com/vybestack/llxprt-code"
  url "https://registry.npmjs.org/@vybestack/llxprt-code/-/llxprt-code-0.9.2.tgz"
  sha256 "1d2d5bb90b73ca7de1167fc9b897d6b0ab89c8fedeff93bf289e985349dad078"
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
