cask "wormhole-cli" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "52cb4b5d4f10010819cf8125bcad5095ca3bc2a4c6859e71e5526ecc0b545732",
         intel: "04a9320009e28d2e3f29d48ccd193ae31708a9f3619df6d7be7e261b209e2e01"

  url "https://github.com/nikuscs/wormhole/releases/download/v#{version}/wormhole-cli-#{arch}-apple-darwin.zip"
  name "Wormhole CLI"
  desc "Secure tunnels for agents, automation, and worktrees"
  homepage "https://github.com/nikuscs/wormhole"

  binary "wormhole"
end
