class Aida < Formula
  desc "Run Spark applications in the Cloud from the command line"
  homepage "https://www.aidalabs.io/docs"
  url "https://cdn.aidalabs.info/aida-v0.0.12.tar.gz"
  sha256 "fd59b7234308aa597f8141ae0d89218c776ab4298eb3158530c4967227bb6973"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    inreplace "bin/aida", /^CLIENT_HOME=/, "export AIDA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/aida"

    # system "./configure", "--disable-debug",
    #                       "--disable-dependency-tracking",
    #                       "--disable-silent-rules",
    #                       "--prefix=#{prefix}"
    # # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system bin/"aida", "version"
  end
end
