class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.12.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline-macos-arm64"
      sha256 "a98da7ce6d6cf20d64a739b84153a8e204fd166ada566b37306d64d52c198dbf"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline-macos-x64"
      sha256 "7de213781584b31569a03c18610fc5bc413c29523fa12e404e07ccbb1867c789"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline-linux-arm64"
      sha256 "0be3bdcc2dd71059b42d15213814964d8b9cf1e224986ec0e00bbf401ac91283"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline-linux-x64"
      sha256 "db64076e0597cfbd817d6a0113b47aafeaa3d06b442fb7ea12c81445b8d2eaee"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline.1"
    sha256 "4f113445e5c8d41932dcdeb46732a884ed1f960b28bdb2becd0060ad4cde539c"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline.5"
    sha256 "a09a86faed775a5d103a5758ccdaa55085238852506ec4c61af0b8a8f991132e"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline.fr.1"
    sha256 "753d39d5b95913a9251203533cfea809f45f00c35e850de09155c30b7411c8d0"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.12.0/nowline.fr.5"
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
