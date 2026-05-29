class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.4.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline-macos-arm64"
      sha256 "2c867a176ac3a7ef0bd09d1f1b8c64ac899ebb9bd352a0aad752fd810f3415fd"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline-macos-x64"
      sha256 "13cb39d074ce6c3a04a5bf492cb56547b8f8a801a1cdf865929c9054f095fe25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline-linux-arm64"
      sha256 "05beaad0a23bb58726cf88f759da4964e20412f07b889286049d34b2b9c3e385"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline-linux-x64"
      sha256 "ccc586243139067a9f743b8d00d6b6128cfd8c14a7564ec6b63b8119dbded44b"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline.1"
    sha256 "7d8b737729980e0c1e162c6236f5ef452425b43a343ae45e257d5f1cf32f2f68"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.4.2/nowline.fr.5"
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
