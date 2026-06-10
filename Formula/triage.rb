class Triage < Formula
  desc "The environment doctor - declarative prerequisite checks"
  homepage "https://github.com/lolay/triage"
  version "0.1.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.1.0/triage_0.1.0_darwin_arm64.tar.gz"
      sha256 "7c3acf28f91160e831d45cae9a589c7880b357414fa221f42035da35037eeb93"
    else
      url "https://github.com/lolay/triage/releases/download/v0.1.0/triage_0.1.0_darwin_amd64.tar.gz"
      sha256 "3513a31b967e5db6f63155215f77b5dddc610ab86683515d73ef128cf864c622"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.1.0/triage_0.1.0_linux_arm64.tar.gz"
      sha256 "da57088a383f116590dc698464647c2ba8475d94b93a39c6f544ef1c73517f96"
    else
      url "https://github.com/lolay/triage/releases/download/v0.1.0/triage_0.1.0_linux_amd64.tar.gz"
      sha256 "a196d65f2b4a93384c661e1ba4159bed45538f2c3293529aa4827b1a7c20020b"
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
