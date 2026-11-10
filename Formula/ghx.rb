class Ghx < Formula
  desc "Clones and refreshes all repos for a GitHub organization"
  homepage "https://github.com/lolay/ghx"
  version "0.4.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.1/ghx_0.4.1_darwin_arm64.tar.gz"
      sha256 "52cfa9be0b4191c04b86cd210c3c72eb59e72645ca9cd0a999400cdf78f93d19"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.1/ghx_0.4.1_darwin_amd64.tar.gz"
      sha256 "8fe4947b292ac22eb1ec668fb507d3883ac1ba658f1aa7147595aa526c9326e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.4.1/ghx_0.4.1_linux_arm64.tar.gz"
      sha256 "cdb800d1c57bef18f2a006ebb74fd8783b5fe654c35240d35c50dce826615f49"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.4.1/ghx_0.4.1_linux_amd64.tar.gz"
      sha256 "29f513cf1767c7fc7395a1eb027cc440c76afab5980faf0e77b9f1e4ff36ddff"
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
