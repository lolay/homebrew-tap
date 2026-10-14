class Ghx < Formula
  desc "Clones and refreshes all repos for a GitHub organization"
  homepage "https://github.com/lolay/ghx"
  version "0.3.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.3.0/ghx_0.3.0_darwin_arm64.tar.gz"
      sha256 "0363dd607ddf69f456e0bae486a860dc22a14f3e434e615d150c5295d5e1ac5c"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.3.0/ghx_0.3.0_darwin_amd64.tar.gz"
      sha256 "e4d497e745c6266cac9cf88dc1f76a9d5f67dcfb200281d650eb67053adf1991"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/ghx/releases/download/v0.3.0/ghx_0.3.0_linux_arm64.tar.gz"
      sha256 "d94718f243e1f1a3a420074852afd922205bc166bdb40d94a832a771d7069180"
    else
      url "https://github.com/lolay/ghx/releases/download/v0.3.0/ghx_0.3.0_linux_amd64.tar.gz"
      sha256 "ce00952611ac9f696c23480a69fa63d7add851049c34a6fde80c4e09e8cc6047"
    end
  end

  def install
    bin.install "ghx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghx --version")
  end
end
