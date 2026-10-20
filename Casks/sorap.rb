cask "sorap" do
  version "0.2.1"
  sha256 "be10f809ea881f2ef5bd349b8b3deaac545754072a8c0dd73f078fb7c6f15963"

  url "https://github.com/colamong/sorap/releases/download/v#{version}/Sorap-#{version}.zip"
  name "Sorap"
  name "서랍"
  desc "Clipboard manager with boards, favorites and snippets"
  homepage "https://github.com/colamong/sorap"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Sorap.app"

  # Sorap is not notarized, so Gatekeeper would block the first launch.
  # Installing through this tap is the user's explicit choice to trust it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Sorap.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/io.github.colamong.sorap",
    "~/Library/Containers/io.github.colamong.sorap",
  ]
end
