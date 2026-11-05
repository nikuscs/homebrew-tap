class Scanr < Formula
  desc "Static analysis and search for TypeScript and JavaScript"
  homepage "https://github.com/nikuscs/scanr"
  version "0.5.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/nikuscs/scanr/releases/download/v0.5.1/scanr-macos-arm64.tar.gz"
      sha256 "9b63aa6b0bc7bcf0cd5a788167aded8fd6f0f5a90284c2164ba1aa887c8e350d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nikuscs/scanr/releases/download/v0.5.1/scanr-linux-x64.tar.gz"
      sha256 "e5b0dbcf6dbed764b7089c6e42a4d690c1eaec1787546586c11a25f8c5f4f4de"
    end
  end

  def install
    bin.install "scanr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scanr --version")
  end
end
