class Ghx < Formula
  desc "Clones and refreshes all repos for a GitHub organization"
  homepage "https://github.com/lolay/ghx"
  version "0.4.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.2/ghx_0.4.2_darwin_arm64.tar.gz"
      sha256 "e9e0f926336cc3540aec3d5ae398c70b6e42451a3f9c7e6dd22a7f876dd4da3e"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.2/ghx_0.4.2_darwin_amd64.tar.gz"
      sha256 "2f703d90e7307ff3edc9e5a5517fd166719207e7d2010ac860517d957c716196"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.2/ghx_0.4.2_linux_arm64.tar.gz"
      sha256 "a00257689aaddf0386d0421b80717f4ffdbc5a5123b95992fd989424eef805e4"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.2/ghx_0.4.2_linux_amd64.tar.gz"
      sha256 "312c8fb16d09faee5fc484a16fd31ece04fa1b808917b68d66108bf403b839f3"
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
