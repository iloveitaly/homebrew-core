class Lxc < Formula
  desc "CLI client for interacting with LXD"
  homepage "https://linuxcontainers.org"
  url "https://linuxcontainers.org/downloads/lxd/lxd-3.23.tar.gz"
  sha256 "e4e1e878753dd30d90d222a54cb5f62bf197fb78d9e85232208cbc54cd3875fd"

  bottle do
    cellar :any_skip_relocation
    sha256 "df4afb1ff0f1c7e3fabffb20c4e2e9689b0c38781c9089e7b600f15cf0d1e026" => :catalina
    sha256 "488f7f61bd23a50cda921323df8fff73ba4396a10c55d331f52dc20cffdcd49b" => :mojave
    sha256 "824959ccdc2a838326d712974f0cb84d5c6a8bbe34e80d962e9d7a5593c08a42" => :high_sierra
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin

    ln_s buildpath/"_dist/src", buildpath/"src"
    system "go", "install", "-v", "github.com/lxc/lxd/lxc"
  end

  test do
    system "#{bin}/lxc", "--version"
  end
end
