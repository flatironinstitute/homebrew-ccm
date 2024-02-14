class Mwrap < Formula
  desc "MATLAB MEX gateway generator"
  homepage "https://github.com/zgimbutas/mwrap"
  url "https://github.com/zgimbutas/mwrap/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "7c007a2c833d956d4805f12922920c8c8f9a47dc3f483ba0ffffca5aa130daed"
  license "MIT"
  head "https://github.com/zgimbutas/mwrap.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/flatironinstitute/ccm"
    sha256 cellar: :any_skip_relocation, ventura:      "22113a7b460fad9d128608ae736c3ddb94c737c4256a1d2193b019caf0121b1c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "80aeb61d13865f89cc047106d422ca9bfb562a93ed69094e45ebd7569bc9f37a"
  end

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
