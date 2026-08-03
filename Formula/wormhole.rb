class Wormhole < Formula
  desc "Secure tunnels for agents, automation, and worktrees"
  homepage "https://github.com/nikuscs/wormhole"
  url "https://github.com/nikuscs/wormhole/releases/download/v0.1.0/source.tar.gz"
  sha256 "d536151272b4d06a1f789a4f79dd4edfd0d6c4d6cd941e51889f40ef2161dbab"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/wormhole-cli")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wormhole --help")
  end
end
