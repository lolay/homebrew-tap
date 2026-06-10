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
      sha256 "8febe87110bbf6787a5377acb3bb7cf73db4503c8e4002b29ff6899c332c8dee"
    else
      url "https://github.com/lolay/triage/releases/download/v0.1.0/triage_0.1.0_darwin_amd64.tar.gz"
      sha256 "e80b90e5120bf83c5d7718f840976220695a88189c1352caa9bbedb750717ffe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.1.0/triage_0.1.0_linux_arm64.tar.gz"
      sha256 "67680256744ee52da16d57bd7791baa8ba130b796381e3c4de9a16defa9d8aec"
    else
      url "https://github.com/lolay/triage/releases/download/v0.1.0/triage_0.1.0_linux_amd64.tar.gz"
      sha256 "b6b51db487167fbe1a120f492dddb0afcb00e8268721adf82a5a46daab6fc948"
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
