class Sctl < Formula
  desc "Scientific Computing Template Library"
  homepage "https://github.com/dmalhotra/SCTL"
  url "https://github.com/dmalhotra/SCTL/archive/refs/tags/1.0.0.tar.gz"
  sha256 "ee1c73802449d187eeeea034f9084a54b91c32ac149e4de7a7c5259e536b9826"
  license "Apache-2.0"
  head "https://github.com/dmalhotra/SCTL.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/flatironinstitute/ccm"
    sha256 cellar: :any_skip_relocation, ventura:      "c1c119b41dd3415da9f99f74fb8e27e3e223ef902f0aa7c9130077bd0cd0dc41"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "abd0a8ddad6048889faf14f66e74bca423eb3f53df90760f4a4a1574daa158ac"
  end

  def install
    include.install Dir["include/*"]
  end

  test do
    system "true"
  end
end
