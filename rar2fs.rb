  class Rar2fs < Formula
  desc "FUSE file system for reading RAR archives"
  homepage "https://hasse69.github.io/rar2fs/"
  url "https://github.com/hasse69/rar2fs/releases/download/v1.29.1/rar2fs-1.29.1.tar.gz"
  sha256 "664d8b3893cb37fd0c46f7cf9d34623f8c8a23891d6a57408f40ec0fa3ac83b3"
  license "GPL-3.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on :osxfuse

  resource "unrarsrc" do
    # https://www.rarlab.com/rar_add.htm
    url "https://www.rarlab.com/rar/unrarsrc-5.9.4.tar.gz"
    sha256 "3d010d14223e0c7a385ed740e8f046edcbe885e5c22c5ad5733d009596865300"
  end

  def install
    resource("unrarsrc").stage do |resource|
      system "make", "lib"
      resource.retain!
      @unrar_path = Dir.pwd
    end

    system "autoreconf", "-f", "-i"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-static-unrar",
                          "--with-fuse=/usr/local/include/osxfuse/fuse",
                          "--with-unrar=#{@unrar_path}"
    
    system "make"
    system 'make', 'install'
  end

  test do
    system "#{bin}/rar2fs", "--version"
  end
end
