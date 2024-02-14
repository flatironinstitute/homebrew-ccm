class Mwrap < Formula
  desc "MATLAB MEX gateway generator"
  homepage "https://github.com/zgimbutas/mwrap"
  url "https://github.com/zgimbutas/mwrap/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "7c007a2c833d956d4805f12922920c8c8f9a47dc3f483ba0ffffca5aa130daed"
  license "MIT"
  head "https://github.com/zgimbutas/mwrap.git", branch: "master"

  uses_from_macos "bison" => :build
  uses_from_macos "flex" => :build

  def install
    system "make", "bin"
    bin.install "mwrap"
    man1.install "doc/mwrap.1"
    share.install "mwrap.pdf"
  end

  test do
    system "#{bin}/mwrap"
  end
end
