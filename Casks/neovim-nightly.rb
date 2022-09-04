require 'open-uri'

BASE_URL = 'https://github.com/neovim/neovim/releases/download/nightly/'.freeze
SHA256_FILENAME = 'nvim-macos.tar.gz.sha256sum'.freeze

cask 'neovim-nightly' do
  url = "#{BASE_URL}#{SHA256_FILENAME}"
  checksum, filename = URI.parse(url).open.read.chomp.split(' ')
  https_filename = "#{BASE_URL}#{filename}"

  version :latest
  sha256 checksum

  url https_filename
  name 'Neovim Nightly'
  homepage 'https://neovim.io/'

  binary 'nvim-macos/bin/nvim'
end
