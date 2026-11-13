class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.13.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline-macos-arm64"
      sha256 "3181b5588b7db423fc5596d7d862e00c1ea7d5a2ddef81c1144dec58561340bb"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline-macos-x64"
      sha256 "7cfcdf28d534ac32541e7ad01126bbcb0e8fedda08a12621df494446b2704047"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline-linux-arm64"
      sha256 "a10afdd19f5dfdba94832ca8c194752d8db55ac23f7de9b9183ccfb8b05d865a"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline-linux-x64"
      sha256 "750037ab5090ef9695b19f71b8a42dfa23ebc27e7338f7d3c9108a98f2609577"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline.1"
    sha256 "bc246855c46b144ad137c48a1f89755f9e91a57970529767c43b7771583aeb39"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline.5"
    sha256 "a09a86faed775a5d103a5758ccdaa55085238852506ec4c61af0b8a8f991132e"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline.fr.1"
    sha256 "bac8224ccf7d6fb0d62e8915592b48167c390e152018a834576853dd70539fcb"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.13.0/nowline.fr.5"
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
