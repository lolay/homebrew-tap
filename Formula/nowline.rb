class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.2.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline-macos-arm64"
      sha256 "a67f4b44a901002d96d5d7903d795cdf41b8e5648a0b005fe71552d204d644c4"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline-macos-x64"
      sha256 "a0f9215584ece7da373637e386cd7edbcd824bac26d5b3a5d4cb86976281448b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline-linux-arm64"
      sha256 "660c665f916cff433f690ecb27ad7245861a52947d9d208ee6620dc710ac5b3d"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline-linux-x64"
      sha256 "bcffea131f665ea0aaacbf9eba3a72d9819476fb8e3f52775898871908e5c9c0"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline.1"
    sha256 "7d8b737729980e0c1e162c6236f5ef452425b43a343ae45e257d5f1cf32f2f68"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.2/nowline.fr.5"
    sha256 "00201367a0de7a0beb6f362ac34f1454b0a423bea9a8104ebd2b060273618f67"
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
