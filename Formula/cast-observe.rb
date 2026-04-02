class CastObserve < Formula
  desc "Session-level observability for Claude Code"
  homepage "https://github.com/ek33450505/cast-observe"
  url "https://github.com/ek33450505/cast-observe/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "1cdd9a4cc24966ed7d86c9179b335d5df63404400bfcf5ca152aacefa9999ba9"
  license "MIT"

  depends_on "python3" => :recommended

  def install
    libexec.install Dir["scripts/*"]
    libexec.install Dir["config/*"]
    libexec.install "settings.json"
    libexec.install "VERSION"

    inreplace "bin/cast-observe",
              'OBSERVE_SCRIPTS_DIR=""',
              "OBSERVE_SCRIPTS_DIR=\"#{libexec}\""

    inreplace "bin/cast-observe",
              /CO_VERSION="\$\(cat.*\|\| echo "unknown"\)"/,
              "CO_VERSION=\"#{version}\""

    bin.install "bin/cast-observe"
  end

  def caveats
    <<~EOS
      Run one-time setup to wire hooks and initialize the database:
        cast-observe install

      This takes under 30 seconds. Then start a Claude Code session
      and run `cast-observe status` to see data flowing in.
    EOS
  end

  test do
    system bin/"cast-observe", "--version"
  end
end
