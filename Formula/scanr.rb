class Scanr < Formula
  desc "Static analysis and search for TypeScript and JavaScript"
  homepage "https://github.com/nikuscs/scanr"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/nikuscs/scanr/releases/download/v0.5.0/scanr-macos-arm64.tar.gz"
      sha256 "99b767b026725ecb4a0d1153a76dfe9466e3dd66987c5375132b3ab221e7e12e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nikuscs/scanr/releases/download/v0.5.0/scanr-linux-x64.tar.gz"
      sha256 "4f9d9942b74f063f15b350938797eaf5ded27a3e8fb99f4e094255568317bb1b"
    end
  end

  def install
    bin.install "scanr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scanr --version")
  end
end
