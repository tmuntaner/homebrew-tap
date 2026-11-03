class C9s < Formula
  desc "Cloud credential manager"
  homepage "https://github.com/tmuntaner/credential-manager"
  url "https://github.com/tmuntaner/credential-manager/archive/refs/tags/v0.1.0-beta1.tar.gz"
  sha256 "cc7c502227049077c0dfee42755507e11f083f5796ae7a37905dd1941a66d964"
  license "EUPL-1.2"

  depends_on "cargo-about" => :build
  depends_on "rust" => :build

  def install
    # license.txt is generated (and gitignored), but the binary embeds it.
    system "cargo", "about", "generate", "about.txt.hbs", "-o", "license.txt"
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/c9s --version")
  end
end
