class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.2.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline-macos-arm64"
      sha256 "427aa185d39e7ee3c41552244abc6101e87643b35af09e444399a4a56bd52071"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline-macos-x64"
      sha256 "71c32541f480423a20ee589470dad13461b2dda85927ce62b0695b20556a0591"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline-linux-arm64"
      sha256 "1d3fff7c85eca7a843d03eaead2b8df3aa6b9fe3c9dc5b25cbe3561c5e54762c"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline-linux-x64"
      sha256 "d0f97a1d3be393c22b87da4ba1c533be411947ab96d4358293e833d43585a455"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline.1"
    sha256 "7d8b737729980e0c1e162c6236f5ef452425b43a343ae45e257d5f1cf32f2f68"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.3/nowline.fr.5"
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
