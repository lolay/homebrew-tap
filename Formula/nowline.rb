class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.4.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline-macos-arm64"
      sha256 "de799303ecf5bf2bdbced54e53c709b4dd3664f5bd25f952d44731239866a54b"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline-macos-x64"
      sha256 "68ad74b4e7c99e516f0f15899c97bdd8e704607a3c12f77d8fc17e687c6a8653"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline-linux-arm64"
      sha256 "bc032144da6e340972de0293d55c89928ca803541d4a36960ce121c0d31a42c4"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline-linux-x64"
      sha256 "6703f0550c6a5e632d8c651e44191fed0deefadd5ff42874222e1d4513049e98"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline.1"
    sha256 "7d8b737729980e0c1e162c6236f5ef452425b43a343ae45e257d5f1cf32f2f68"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.1/nowline.fr.5"
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
