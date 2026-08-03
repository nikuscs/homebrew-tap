class Wormhole < Formula
  desc "Secure tunnels for agents, automation, and worktrees"
  homepage "https://github.com/nikuscs/wormhole"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.0/wormhole-cli-aarch64-apple-darwin.zip"
      sha256 "52cb4b5d4f10010819cf8125bcad5095ca3bc2a4c6859e71e5526ecc0b545732"
    else
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.0/wormhole-cli-x86_64-apple-darwin.zip"
      sha256 "04a9320009e28d2e3f29d48ccd193ae31708a9f3619df6d7be7e261b209e2e01"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/nikuscs/wormhole/releases/download/v0.1.0/wormhole-cli-aarch64-unknown-linux-gnu.zip"
    sha256 "7531185a1074fbaa12eefd595533ffb7ba550fef142eaad2d6511ebd586bdeaa"
  else
    url "https://github.com/nikuscs/wormhole/releases/download/v0.1.0/wormhole-cli-x86_64-unknown-linux-gnu.zip"
    sha256 "f493b2ef73caede420b34e2376933bfd65ac8a6dcad0f7121c0c6ac249bac936"
  end

  def install
    bin.install "wormhole"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wormhole --help")
  end
end
