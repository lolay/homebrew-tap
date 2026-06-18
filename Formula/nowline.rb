class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.8.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline-macos-arm64"
      sha256 "46681b7b7d310435298ca962e8d71bbbabcc00bf0f6bc139ed28056e1a9cf7c1"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline-macos-x64"
      sha256 "2f7afb1b1702e455e8329acfad9ada039bf1c75e53efbf514f653e392ff123f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline-linux-arm64"
      sha256 "41fc8abfc9917e192aae04f36017ea36ea17437fface136a0afd7d22e696a715"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline-linux-x64"
      sha256 "e22cfe2b097ce9909e7d8b9935ea8ca2aeb4917d43d38213ac7584c713e18b58"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline.1"
    sha256 "7ade8922bd98270f2ea6aa1c8fcb3947689fa54af5ce7177f41658eba4b97b41"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.2/nowline.fr.5"
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
