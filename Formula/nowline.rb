class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.2.5"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline-macos-arm64"
      sha256 "21ea71ebf36d8e52ef34288ac373fb3ad21763d7cf1290a5c439732001cf58a9"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline-macos-x64"
      sha256 "f215baeecc4367256edada099f2d96b4a2d54331cd1fdb145d2653ec1af571ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline-linux-arm64"
      sha256 "08ebd5d6be9fc37ef8dbaefa15401b73c3c5e7f3b7e1fff9f5ca7be9028b9871"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline-linux-x64"
      sha256 "aeade5c85282772c441b2a99a4b54710c019e21eefc371f9c2ff79f271b25188"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline.1"
    sha256 "7d8b737729980e0c1e162c6236f5ef452425b43a343ae45e257d5f1cf32f2f68"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.5/nowline.fr.5"
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
