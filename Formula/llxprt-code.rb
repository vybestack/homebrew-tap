class LlxprtCode < Formula
  desc "AI-powered coding assistant CLI"
  homepage "https://github.com/vybestack/llxprt-code"
  url "https://registry.npmjs.org/@vybestack/llxprt-code/-/llxprt-code-0.9.0.tgz"
  sha256 "706448d82e06f9de05b6d9055a8daf5bcd009e4eab0764b65b1058ea7500bd3a"
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
