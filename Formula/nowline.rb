class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.8.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline-macos-arm64"
      sha256 "e2f88fc3ff71a16877d40204ef16755f8cfa6d43ee38158cdcb8a29a312722d8"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline-macos-x64"
      sha256 "8c8a4fcd78b3e4267e4010a60ddae80c4f5d632a37a6484c432c66a14aeaf83c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline-linux-arm64"
      sha256 "6d390c3f04a02f951a7bac2af1b32716da99bc97e64d1160f5264a28c79e0ba9"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline-linux-x64"
      sha256 "fa4e2dff9229d872280ee1963d6ae2f3983fe2438e654cb1550ed2930d2530c6"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline.1"
    sha256 "7ade8922bd98270f2ea6aa1c8fcb3947689fa54af5ce7177f41658eba4b97b41"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.8.1/nowline.fr.5"
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
