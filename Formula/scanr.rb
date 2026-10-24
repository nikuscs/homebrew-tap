class Scanr < Formula
  desc "Static analysis and search for TypeScript and JavaScript"
  homepage "https://github.com/nikuscs/scanr"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/nikuscs/scanr/releases/download/v0.4.0/scanr-macos-arm64.tar.gz"
      sha256 "dea50ee46a9052e979057ae82d3d8e12139d3db560b910202389770c3c88c701"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nikuscs/scanr/releases/download/v0.4.0/scanr-linux-x64.tar.gz"
      sha256 "927c483c9de22b78c1b3f2f9802b440532e62383a560f13a0d37379adb4a3457"
    end
  end

  def install
    bin.install "scanr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scanr --version")
  end
end
