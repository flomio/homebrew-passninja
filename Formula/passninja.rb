class Passninja < Formula
  desc "Command-line interface for the PassNinja API"
  homepage "https://github.com/flomio/passninja-cli"
  url "https://github.com/flomio/passninja-cli/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "ed5edfef5dbb69a5520b8d2ea7697867908e7c58ee4343bb879a206cb1c49093"
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
