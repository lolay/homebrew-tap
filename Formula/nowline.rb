class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.9.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline-macos-arm64"
      sha256 "2b0e30cc3a5dd7b96b7fae41029d553802c7aae7ad0af2bcc3430a3ab1e086d4"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline-macos-x64"
      sha256 "55ad078c9f99bca2b4e667e4dc9ce00ba11fbce298fd748fbdd2745665ecf7f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline-linux-arm64"
      sha256 "9c3687dea9586e6ab503ac12c4396500b9a1887634380349f4fbe39553a71d13"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline-linux-x64"
      sha256 "7e3f9d42a75682a80d9957231c61e50de23caca39a26150d1e644c16b8493191"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline.1"
    sha256 "3fc6d77fadcf4ba2add7f127da8cff257262ed010f253a1b0a0e7801b56f0d4f"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline.5"
    sha256 "a09a86faed775a5d103a5758ccdaa55085238852506ec4c61af0b8a8f991132e"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline.fr.1"
    sha256 "85b35d155176698634ad0de7094d56a74f4db448ce7b2c15cb3e4a968d20ab64"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.9.0/nowline.fr.5"
    sha256 "09921206ae0c0513b0d3b218ae988a8eb93e10c7ec3b8eefafe19aa3c6a6e95e"
  end

  def install
    bin.install Dir["nowline-*"].first => "nowline"
    resource("manpage").stage { man1.install "nowline.1" }
    resource("manpage5").stage { man5.install "nowline.5" }
    resource("manpage-fr").stage { (share/"man/fr/man1").install "nowline.fr.1" => "nowline.1" }
    resource("manpage-fr-5").stage { (share/"man/fr/man5").install "nowline.fr.5" => "nowline.5" }
  end

  test do
    system "#{bin}/nowline", "--version"
  end
end
