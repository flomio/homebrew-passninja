class Passninja < Formula
  desc "Command-line interface for the PassNinja API"
  homepage "https://github.com/flomio/passninja-cli"
  url "https://github.com/flomio/passninja-cli/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "84e5a2e13a3e41744deb2651bf76b70442a025b1772a5fb9a2963902b8ea9905"
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
