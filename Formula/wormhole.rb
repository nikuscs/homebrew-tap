class Wormhole < Formula
  desc "CLI for exposing local services through Wormhole relays and provider tunnels"
  homepage "https://github.com/nikuscs/wormhole"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.1/wormhole-cli-aarch64-apple-darwin.zip"
      sha256 "c3e0938d5ba26f76cd643373cbd2062749c6b13afb10767754bf4c4e26438c7a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.1/wormhole-cli-x86_64-apple-darwin.zip"
      sha256 "355bd87817a2f0164d14558bc1c5595743295e13984484891370ce7d6343acf9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.1/wormhole-cli-aarch64-unknown-linux-gnu.zip"
      sha256 "6c66a3d0d4614cd2a4a3ec6b35ea28be9eac1676bfd9d3c192cb3ea960f9eb55"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikuscs/wormhole/releases/download/v0.2.1/wormhole-cli-x86_64-unknown-linux-gnu.zip"
      sha256 "0bb5a18c6250b1e263609f42e03d899e24934a7d17c6aca20fe78a5247a74edd"
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
