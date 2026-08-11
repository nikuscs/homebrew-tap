class Wormhole < Formula
  desc "CLI for exposing local services through Wormhole relays and provider tunnels"
  homepage "https://github.com/nikuscs/wormhole"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.0/wormhole-cli-aarch64-apple-darwin.zip"
      sha256 "9178a1bb9f0aff6aecbd9c3e46bdafb57df2ec42c52b38e3dc0f48a1cbe8a217"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.0/wormhole-cli-x86_64-apple-darwin.zip"
      sha256 "45d13fa4c82b7ddfa6cda57a816ccf74db0ceb845806a70b4b68d565cc23569a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.0/wormhole-cli-aarch64-unknown-linux-gnu.zip"
      sha256 "fa0c692deb906167a0408c7b2d6338151080dd7b21cbb85bfcf6e9ceea579fba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.0/wormhole-cli-x86_64-unknown-linux-gnu.zip"
      sha256 "01926c02b0a8fc38a8e833fb5b66b451cd7b59813e953848827172ff8f013b83"
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
