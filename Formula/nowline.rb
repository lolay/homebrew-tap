class Nowline < Formula
  desc "Parse, validate, and convert .nowline roadmap files"
  homepage "https://github.com/lolay/nowline"
  version "0.10.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline-macos-arm64"
      sha256 "71d0de7484cf3f71d63914f0aaab2dcab71f7da37cf2c8e9bc852aad5f84d552"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline-macos-x64"
      sha256 "1b0c36d16bd35f9353a395ec3c7cc3b5de4dd218d27fe1e61ba5a40d1d84edf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline-linux-arm64"
      sha256 "3dd757001f8536e55318af33d1a3a822d3d53832dccc25a5a2ed9f2fe5c7506c"
    else
      url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline-linux-x64"
      sha256 "352d1dce42b70905665a324a4d4163c633a4a4458aea954d3abd79f5b69cdbce"
    end
  end

  resource "manpage" do
    url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline.1"
    sha256 "032668f06f1c5fa404d9e94021ed15b045372a5d155f3eac56cec4daffaf6630"
  end

  resource "manpage5" do
    url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline.5"
    sha256 "a09a86faed775a5d103a5758ccdaa55085238852506ec4c61af0b8a8f991132e"
  end

  resource "manpage-fr" do
    url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline.fr.1"
    sha256 "31ef9824b83563da1faac3550d60c9f0f38d4b50a25c12a81fc38b25c7564724"
  end

  resource "manpage-fr-5" do
    url "https://github.com/lolay/nowline/releases/download/v0.10.0/nowline.fr.5"
    sha256 "09921206ae0c0513b0d3b218ae988a8eb93e10c7ec3b8eefafe19aa3c6a6e95e"
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
