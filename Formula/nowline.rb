class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.8.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline-macos-arm64"
      sha256 "2a2dfc7a8f41f0197ee70cc1e393af7f5afc7c1606cfe4e3259764352817e601"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline-macos-x64"
      sha256 "bdb336f3e1f3c49e5b98fe516c3fc7b2a051e431fc065a084f521fe40d7c3703"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline-linux-arm64"
      sha256 "61dae55d055f30e4f18954fe3d65cb23287a6420caedef1bdda0b5fd087545f8"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline-linux-x64"
      sha256 "e7bfc4e78983b2c95d26905d4be9e45d9da73efbeaa83a4d61452b2adc64bbae"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline.1"
    sha256 "7ade8922bd98270f2ea6aa1c8fcb3947689fa54af5ce7177f41658eba4b97b41"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.3/nowline.fr.5"
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
