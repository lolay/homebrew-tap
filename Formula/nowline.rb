class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.5.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline-macos-arm64"
      sha256 "4067e34a23367c52eee604e4f9021bc7f6329950e88b689a6bea3c90d07dc589"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline-macos-x64"
      sha256 "d9014af0896036c86d14a7f11189f337fbade126b04735f6d448bb10152169b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline-linux-arm64"
      sha256 "e6f6ccf12506ba899fc3a517f1f8a4de11ec135e3fe3825e4780533cdece2ce5"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline-linux-x64"
      sha256 "99193619577abcccbed5aaf526691d54528c9f291c245224037daa8686c08a41"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline.1"
    sha256 "7d8b737729980e0c1e162c6236f5ef452425b43a343ae45e257d5f1cf32f2f68"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.1/nowline.fr.5"
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
