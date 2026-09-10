class Passninja < Formula
  desc "Command-line interface for the PassNinja API"
  homepage "https://github.com/flomio/passninja-cli"
  url "https://github.com/flomio/passninja-cli/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "c2fddd6b66f707ffeca15670265e801bdf2156eef9b190639c1a264423ed94d0"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=brew
      -X main.buildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/passninja version")
  end
end
