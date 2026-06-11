class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.7.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline-macos-arm64"
      sha256 "d76cef2f9ef6c3fdbe650702189f5ace7b97393d5a207f24c794f718223570d6"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline-macos-x64"
      sha256 "fb8fc5e99a4d0b83c24848ac3255d766865e19bf5eaf24e2c097d9d49ce88620"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline-linux-arm64"
      sha256 "2ddb2f93414a86e8a7aae9be734f26493ed96c5698966bce9fdcf2c35e161761"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline-linux-x64"
      sha256 "48a7c481f57d4f5a7602bead8320a4b8b6431347e876da5007af6df8a1f3ae4a"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline.1"
    sha256 "7ade8922bd98270f2ea6aa1c8fcb3947689fa54af5ce7177f41658eba4b97b41"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.7.0/nowline.fr.5"
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
