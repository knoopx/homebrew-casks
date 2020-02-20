
cask 'cmc-menulet' do
  version '1.0.4'
  sha256 'bf4cea828a2dd7c932493e26bbbe11603288a81aab1d9334b045a4f82d82198c'

  url "https://github.com/knoopx/cmc-menulet/releases/download/v#{version}/CoinMarketCap-#{version}-mac.zip"
  name 'CoinMarketCap'
  homepage 'https://github.com/knoopx/cmc-menulet'

  app 'CoinMarketCap.app'
end
