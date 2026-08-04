class Wormhole < Formula
  desc "Secure tunnels for agents, automation, and worktrees"
  homepage "https://github.com/nikuscs/wormhole"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.1/wormhole-cli-aarch64-apple-darwin.zip"
      sha256 "e2bd61bbf4858fbba4541f6b0aab9221a005be2ca7e315250f110311114453d1"
    else
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.1/wormhole-cli-x86_64-apple-darwin.zip"
      sha256 "fe71fc267f27a645d166bc64ed020cfd8e756782231afc82111defc706ba4540"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/nikuscs/wormhole/releases/download/v0.1.1/wormhole-cli-aarch64-unknown-linux-gnu.zip"
    sha256 "a9d6a8a259fa60b8446eb49d6cda0d512da6d9dd05e2c9a4329f238564bccc33"
  else
    url "https://github.com/nikuscs/wormhole/releases/download/v0.1.1/wormhole-cli-x86_64-unknown-linux-gnu.zip"
    sha256 "c17c539a09e08d703ebdd5613b47a34b8149b4db839f97dc01cd904a5d88c9df"
  end

  def install
    bin.install "wormhole"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wormhole --help")
  end
end
