class Sctl < Formula
  desc "Scientific Computing Template Library"
  homepage "https://github.com/dmalhotra/SCTL"
  url "https://github.com/dmalhotra/SCTL/archive/refs/tags/1.0.0.tar.gz"
  sha256 "ee1c73802449d187eeeea034f9084a54b91c32ac149e4de7a7c5259e536b9826"
  license "Apache-2.0"
  head "https://github.com/dmalhotra/SCTL.git", branch: "master"

  def install
    include.install "include/sctl"
    include.install "include/sctl.hpp"
  end

  test do
    system "true"
  end
end
