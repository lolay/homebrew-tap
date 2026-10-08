class Triage < Formula
  desc "The environment doctor - declarative prerequisite checks"
  homepage "https://github.com/lolay/triage"
  version "0.4.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.4.1/triage_0.4.1_darwin_arm64.tar.gz"
      sha256 "31a046c4f7116548a7591fa65f51ae95d514195a9b390fdb577694966e39186e"
    else
      url "https://github.com/lolay/triage/releases/download/v0.4.1/triage_0.4.1_darwin_amd64.tar.gz"
      sha256 "554cc48a1c80fcbc5e149387fdc0ab115793c5b936de68000831609a4e9592ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.4.1/triage_0.4.1_linux_arm64.tar.gz"
      sha256 "ec01232e0afa697a22b0787e1370a7e4dcf6e6435e84bb825af5a13a909268de"
    else
      url "https://github.com/lolay/triage/releases/download/v0.4.1/triage_0.4.1_linux_amd64.tar.gz"
      sha256 "3457fa024a4db3474b8292ab2ad4b21bd014ed6c5c104d1d5a437f7b2739afb4"
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
