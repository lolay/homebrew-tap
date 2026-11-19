class Ghx < Formula
  desc "Clones and refreshes all repos for a GitHub organization"
  homepage "https://github.com/lolay/ghx"
  version "0.4.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.3/ghx_0.4.3_darwin_arm64.tar.gz"
      sha256 "d71857b68bb099e1c8900f2f49f87f7c4faabe2315b45ac89811e95527d097fd"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.3/ghx_0.4.3_darwin_amd64.tar.gz"
      sha256 "85cbea82e8166d8c31c049203c999a88e3eba77b6581563b6981a539577182f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.3/ghx_0.4.3_linux_arm64.tar.gz"
      sha256 "6e8b8a24cc624815bb8f9e1355e636cc4faae373d03cb4a7a5e916a0c74c38fb"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.3/ghx_0.4.3_linux_amd64.tar.gz"
      sha256 "a92e16b4ef494ffd3663c27ce0f9ca6943c654870f11f7e5cbd5f204a7d1966e"
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
