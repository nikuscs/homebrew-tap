class Wormhole < Formula
  desc "CLI for exposing local services through Wormhole relays and provider tunnels"
  homepage "https://github.com/nikuscs/wormhole"
  version "0.2.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.2/wormhole-cli-aarch64-apple-darwin.zip"
      sha256 "0073a882ad3c4dba5021f089dfff0e36053f14cb67576c48ffac7aea94292e64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.2/wormhole-cli-x86_64-apple-darwin.zip"
      sha256 "bdec7bf7f6915ffefdb815a3652bd0b5d08205491c9464db1198625e1ebfc95f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.2/wormhole-cli-aarch64-unknown-linux-gnu.zip"
      sha256 "5c61bac090e3dd782b8de5ae0c5b84f7aa334f44a2daa80d5855e1f5331a4997"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.2/wormhole-cli-x86_64-unknown-linux-gnu.zip"
      sha256 "520ad625c001e951697b5e4d6e938dbaa4b9204f5b91438b6c1988f04881e9e9"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "wormhole"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "wormhole"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "wormhole"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "wormhole"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
