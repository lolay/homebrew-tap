class Ghx < Formula
  desc "Clones and refreshes all repos for a GitHub organization"
  homepage "https://github.com/lolay/ghx"
  version "0.2.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.2.0/ghx_0.2.0_darwin_arm64.tar.gz"
      sha256 "9f037241569ce65c9f189152b40e15957dacb4b2c1018d48d698c8f818ceeb9f"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.2.0/ghx_0.2.0_darwin_amd64.tar.gz"
      sha256 "94a04b7107b9f232a09552d4e32e456aa1b3d836828ec5b8b3d7e27e3cb3f0cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.2.0/ghx_0.2.0_linux_arm64.tar.gz"
      sha256 "0c2cc2579e412475b5b39e08c66d672a3c65b64d690f43e1b56f52fddf15f6a7"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.2.0/ghx_0.2.0_linux_amd64.tar.gz"
      sha256 "8cddbc70e370eaa92e3ce78e596228a17ef0b7f974e07cdc36a4b75d4be39515"
    end
  end

  def install
    bin.install "ghx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghx --version")
  end
end
