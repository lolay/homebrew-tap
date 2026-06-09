class Triage < Formula
  desc "The environment doctor - declarative prerequisite checks"
  homepage "https://github.com/lolay/triage"
  version "0.3.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.3.0/triage_0.3.0_darwin_arm64.tar.gz"
      sha256 "92013eaca63a4dee1a8563b8e08eed34ffa41c34069b0cbb8c742d05dbc8bc11"
    else
      url "https://github.com/lolay/triage/releases/download/v0.3.0/triage_0.3.0_darwin_amd64.tar.gz"
      sha256 "8a0d0500bb4a691f60eaf23f305beae72e0bdc0890025fd3a1cf43cfc02ad8c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.3.0/triage_0.3.0_linux_arm64.tar.gz"
      sha256 "4bca3447270c606145552b2aa9fa72c3a840de10c983989cc5724614402de756"
    else
      url "https://github.com/lolay/triage/releases/download/v0.3.0/triage_0.3.0_linux_amd64.tar.gz"
      sha256 "340879d7a64a490505564f552e6e2a82064b882379207caf1b0b75058c006060"
    end
  end

  def install
    bin.install "triage"
    man1.install "triage.1"
    man5.install "triage.5"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/triage --version")
  end
end
