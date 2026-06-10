class Triage < Formula
  desc "The environment doctor - declarative prerequisite checks"
  homepage "https://github.com/lolay/triage"
  version "0.4.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.4.0/triage_0.4.0_darwin_arm64.tar.gz"
      sha256 "b497f3f2f97aa0f5e6ef5730954af1ff7c0023abd96a3df9af246ae2334f94be"
    else
      url "https://github.com/lolay/triage/releases/download/v0.4.0/triage_0.4.0_darwin_amd64.tar.gz"
      sha256 "6fdbcefefc3566505bb8531f263c3511d7542deccf46e716313e2e855bde5287"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/triage/releases/download/v0.4.0/triage_0.4.0_linux_arm64.tar.gz"
      sha256 "bab64606cf19ad2119a9f2eafb70588e35057190778211b5804e2f6db17e5685"
    else
      url "https://github.com/lolay/triage/releases/download/v0.4.0/triage_0.4.0_linux_amd64.tar.gz"
      sha256 "98a811b346bcdfad83b322a516f59d57682bca32c8028d208b8f3fca3f79062a"
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
