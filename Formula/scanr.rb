class Scanr < Formula
  desc "Static analysis and search for TypeScript and JavaScript"
  homepage "https://github.com/nikuscs/scanr"
  version "0.2.4"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/nikuscs/scanr/releases/download/v0.2.4/scanr-macos-arm64.tar.gz"
      sha256 "da493f52c30de5f5a7859edeae37913dd302bdc0f6873380c7863d6c8737b4fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nikuscs/scanr/releases/download/v0.2.4/scanr-linux-x64.tar.gz"
      sha256 "0a84da2ccf3786235428cb207cddba86d1dcc57a4f537bbd1db968d985c8872d"
    end
  end

  def install
    bin.install "scanr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scanr --version")
  end
end
