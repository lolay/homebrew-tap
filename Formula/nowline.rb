class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.11.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline-macos-arm64"
      sha256 "102fa9b41e2d36eb9acb855613688440f80451157fbe8dc5bfdc055cf82d4a60"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline-macos-x64"
      sha256 "d699889f5f695690581e091b00710c0df035c2cae9c5f12e2748eb8b298b75d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline-linux-arm64"
      sha256 "28f18b6fb64bd8e471b411a85aab0c29d5f59ad1d1d3c0bd5b88f52b37e29361"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline-linux-x64"
      sha256 "eded5f1a08309a25d5f758696a5c40540a397f4f6db5c274820146d35e23777f"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline.1"
    sha256 "4f113445e5c8d41932dcdeb46732a884ed1f960b28bdb2becd0060ad4cde539c"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline.5"
    sha256 "a09a86faed775a5d103a5758ccdaa55085238852506ec4c61af0b8a8f991132e"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline.fr.1"
    sha256 "753d39d5b95913a9251203533cfea809f45f00c35e850de09155c30b7411c8d0"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.11.0/nowline.fr.5"
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
