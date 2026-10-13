class Triage < Formula
  desc "The environment doctor - declarative prerequisite checks"
  homepage "https://github.com/lolay/triage"
  version "0.5.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.5.0/triage_0.5.0_darwin_arm64.tar.gz"
      sha256 "4fa05c13d159722f8f0812bd8b11a109f984cc35e40169e37f2285eeaf80cb16"
    else
      url "https://github.com/lolay/triage/releases/download/v0.5.0/triage_0.5.0_darwin_amd64.tar.gz"
      sha256 "11ab6b490c8b018d3339246fb330faa9ebf38ab76815026c7792cd418508296a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.5.0/triage_0.5.0_linux_arm64.tar.gz"
      sha256 "75b342bc9b9bf5dbcc34625873885e0d05770d56082510c4be74e83889e421b1"
    else
      url "https://github.com/lolay/triage/releases/download/v0.5.0/triage_0.5.0_linux_amd64.tar.gz"
      sha256 "8a8cfbb7e976cef6977cabe2dd53ae09f857c4722d3b661b4e3f113cd4eb975c"
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
