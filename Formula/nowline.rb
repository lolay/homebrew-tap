class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.2.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline-macos-arm64"
      sha256 "c01ac45f911868086224fcbd82b5ecc42a912ea709c9cd7bc292be56e4b5578c"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline-macos-x64"
      sha256 "a20c9d5481d82623b5c072d3c9094541cad9971e5818d1b803cf21adc1906864"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline-linux-arm64"
      sha256 "9bcd74d45ceff20a05e685ff28e306693e3ba0f4cbc81a48acb1f36f3613d1ad"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline-linux-x64"
      sha256 "2b892ce0c7cbdbb76c6fb697fef7a95c47435988c87440d64f33a784e1535773"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline.1"
    sha256 "e21a594173f56e8ea82af016df2828fc2ee0342cf0340796463566c07e37c319"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline.5"
    sha256 "803286750016d18dbb8e095e876f92b59268fae379291b14e4c6c3f715dd4f37"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline.fr.1"
    sha256 "984ba4cc2449e57c6e6582510ba25288a2d25720d9b7bedd236db9f5a1286184"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.2.0/nowline.fr.5"
    sha256 "031d40bd852c8d5c2e03b225a0e13f165274b551e56dd89b5a590bbead6c72e2"
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
