class Fmm3d < Formula
  desc "Fast multipole methods in three dimensions"
  homepage "https://fmm3d.readthedocs.io"
  url "https://github.com/flatironinstitute/FMM3D/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "e29a1ebe485d2431d4e330334b2853bc91b957afde6e24c2991099b28bd2b97c"
  license "Apache-2.0"
  head "https://github.com/flatironinstitute/FMM3D.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/flatironinstitute/ccm"
    sha256 cellar: :any,                 arm64_ventura: "6caeebd96fdf3d13163363f53d139632da31bb35d9dc6fb5d8b2cfaf8dec8ef6"
    sha256 cellar: :any,                 ventura:       "bbfc7ce408a03f1a0b3edf83e61733090ee22fb61c507cbadf881f295cd84742"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ad63309f3028f6dde2dbcb3a8f4d3835c2858999634fac022b9ee05f500bdf1f"
  end

  depends_on "gcc"

  def install
    ln_s "make.inc.macosx.gnu", "make.inc" if OS.mac?

    # Don't use -march=native when building a bottle
    inreplace "makefile", "-march=native", "" if build.bottle?

    # Build libraries
    system "make", "lib"

    # Install libraries
    lib.install "lib/libfmm3d.so"
    lib.install "lib-static/libfmm3d.a"
  end

  test do
    system "true"
  end
end
