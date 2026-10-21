# Rendered by packaging/update-tap.sh for each release. Edit the template in
# heapsgoodstudio/agent-observability, not the copy in the tap.
class AgentObservability < Formula
  desc "Local dashboard for Claude Code and Codex usage, allowances and sessions"
  url "https://github.com/heapsgoodstudio/agent-observability/releases/download/v0.1.0/agent-observability-0.1.0-macos.tar.gz"
  sha256 "e407fc3efe3ad899d985dcf1c4593f4ad583b19d6f6a26042c8ea8ca989b72fd"
  license "MIT"

  depends_on :macos

  def install
    bin.install "claude-obs"
  end

  def caveats
    <<~EOS
      Set up the dashboard and its background services:
        claude-obs install

      After each `brew upgrade agent-observability`, update them:
        claude-obs install --upgrade

      Before `brew uninstall agent-observability`, remove them:
        claude-obs uninstall

      The dashboard runs at http://localhost:8427.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-obs version")
  end
end
