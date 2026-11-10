cask "sml-corners" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/shamwela/sml-corners/releases/download/v#{version}/SML-Corners-#{version}.zip"
  name "SML Corners"
  desc "Run actions by pressing the corners of your trackpad"
  homepage "https://github.com/shamwela/sml-corners"

  depends_on macos: ">= :ventura"

  app "SML Corners.app"

  # The app is not notarized. Remove the download quarantine so that it opens without a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SML Corners.app"]
  end

  uninstall quit: "local.sml-corners"

  zap trash: [
    "~/.config/sml-corners",
    "~/Library/Preferences/local.sml-corners.plist",
  ]
end
