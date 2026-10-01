class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.8.6"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline-macos-arm64"
      sha256 "464c70c8ef53f8db59d935e7a3569e178020b2c64bb8a019ce0736218caf6c19"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline-macos-x64"
      sha256 "ee03c4c3cd118d6c800d7be63b70dec14046e7661581f5d7cde65b13bed12774"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline-linux-arm64"
      sha256 "f55fce6aa052c02423ea3e44897fc8b7653e24ad06c06fda60f6fdc64b25811a"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline-linux-x64"
      sha256 "295c98a3aaa6c2c959b39ff12ec48b0c3f6e556e4a7cd7975e77f3da6b8c5b2a"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline.1"
    sha256 "7ade8922bd98270f2ea6aa1c8fcb3947689fa54af5ce7177f41658eba4b97b41"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.6/nowline.fr.5"
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
