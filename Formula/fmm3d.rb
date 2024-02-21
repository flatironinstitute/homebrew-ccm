class Fmm3d < Formula
  desc "Fast multipole methods in three dimensions"
  homepage "https://fmm3d.readthedocs.io"
  url "https://github.com/flatironinstitute/FMM3D/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "e29a1ebe485d2431d4e330334b2853bc91b957afde6e24c2991099b28bd2b97c"
  license "Apache-2.0"
  head "https://github.com/flatironinstitute/FMM3D.git", branch: "master"

  depends_on "gcc"

  def install
    ln_s "make.inc.macosx.gnu", "make.inc" if OS.mac?

    # Don't use -march=native when building a bottle
    inreplace "makefile", "-march=native", "-march=#{Hardware.oldest_cpu}" if build.bottle?

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
