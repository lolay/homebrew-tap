class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.8.5"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline-macos-arm64"
      sha256 "2f54d902085c2c7fe0957bb7ae2c022acc0cae4eee19f890c81aab6cad9ab4a2"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline-macos-x64"
      sha256 "f0defbc8e2fd9512c0bd7e7ba6c8a9669e3379cd5ffe8c5d656d8e8133aeed87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline-linux-arm64"
      sha256 "262bdf889cb875f2acc78612f2cdabc4dc67235604a76ce9fd12866e044d0032"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline-linux-x64"
      sha256 "3eb2de42f81cd3a6252309605a31c214930be7ef3b47bbeb6ab537c3c8fd20b0"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline.1"
    sha256 "7ade8922bd98270f2ea6aa1c8fcb3947689fa54af5ce7177f41658eba4b97b41"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.5/nowline.fr.5"
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
