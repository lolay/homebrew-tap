class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.5.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline-macos-arm64"
      sha256 "ea39de21cd44eb5c3e56139ef0aba2ddfde6f7e179e5046f62e5fedd8af1587f"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline-macos-x64"
      sha256 "095787557d7a612a6c6b61c647a5781969311f67dfedaa97fc104b96d23a35f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline-linux-arm64"
      sha256 "a6df35c4cd558c39c9eab6a41825152432cf4e1d0cb27eb48c964b77b4c66ed7"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline-linux-x64"
      sha256 "05b988d7c4f315dc440aa9285480b130f162a1d647687724c6e8e1cd108a30f2"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline.1"
    sha256 "7d8b737729980e0c1e162c6236f5ef452425b43a343ae45e257d5f1cf32f2f68"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline.5"
    sha256 "70915450974cef72f8cc9bebb4ffc006a1fbb7bfee53ee44a61b9577626902b0"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline.fr.1"
    sha256 "fab9f78b72f557219c8b388d454e1dc0220a0856a77dee278f58fc08cb704fe2"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.5.0/nowline.fr.5"
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
