cask "sorap" do
  version "0.1.0"
  sha256 "ed071a180dfc92589ecf97c2f244f4a33f153006becc711096df55f41fa10500"

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
  depends_on macos: ">= :sonoma"

  app "Sorap.app"

  zap trash: [
    "~/Library/Application Scripts/io.github.colamong.sorap",
    "~/Library/Containers/io.github.colamong.sorap",
  ]
end
