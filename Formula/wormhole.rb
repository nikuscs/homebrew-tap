class Wormhole < Formula
  desc "CLI for exposing local services through Wormhole relays and provider tunnels"
  homepage "https://github.com/nikuscs/wormhole"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.2/wormhole-cli-aarch64-apple-darwin.zip"
      sha256 "5267d7e1510ccff00a149b5ec5621a5c77f55f3bd73e2026346d7dee34c79908"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.2/wormhole-cli-x86_64-apple-darwin.zip"
      sha256 "7ececbe3f3cf97c2a63cff02056087f2bcf0440523897ab9510fa6a41856517e"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.2/wormhole-cli-aarch64-unknown-linux-gnu.zip"
      sha256 "81e193a471b9357afd54a5fb95fd0d1d686a413d5fa2b9843b6c2b0ac95ef687"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.1.2/wormhole-cli-x86_64-unknown-linux-gnu.zip"
      sha256 "170051d073047013bdaca9e4dc1003c7e649d2b10008c94e543c3c0634763985"
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
