class Ghx < Formula
  desc "Clones and refreshes all repos for a GitHub organization"
  homepage "https://github.com/lolay/ghx"
  version "0.4.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.0/ghx_0.4.0_darwin_arm64.tar.gz"
      sha256 "48d04832158287d6b5a8affc90a9436451b61377a57a442741a6a92010a49ad5"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.0/ghx_0.4.0_darwin_amd64.tar.gz"
      sha256 "67ab7305a7f7734fb7cec0b6683fd8bfbaf89063f483daba20b2b82054627a15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.0/ghx_0.4.0_linux_arm64.tar.gz"
      sha256 "1184bc28dcba68fb885ce916991aec2651ae94dcaadf94cbe569895e0fc37d20"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.0/ghx_0.4.0_linux_amd64.tar.gz"
      sha256 "e79a6b812e38c9ac2a0864587ecee1e4ca5db688c917ba46ce4b6d257b26e204"
    end
  end

  def install
    bin.install "ghx", "ghb"
    man1.install "manpages/ghx.1", "manpages/ghb.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghx --version")
    assert_match version.to_s, shell_output("#{bin}/ghb --version")
  end
end
