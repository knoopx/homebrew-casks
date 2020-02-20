cask 'plex-music' do
  version '1.1.0'
  sha256 'f7ebb1e79b473b66fc95a044aff88b630cc23e640b86a08d81a618ced054a3e2'

  url "https://github.com/knoopx/plex-music/releases/download/v#{version}/Plex.Music.zip"
  name 'Plex Music'
  homepage 'https://github.com/knoopx/plex-music/'

  app 'Plex Music.app'
end
