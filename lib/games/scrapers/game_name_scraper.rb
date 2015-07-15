require 'nokogiri'
require 'open-uri'

class GameNameScraper
  def lookup_game_name(game_name)
    url = URI.escape("http://www.ign.com/search?q=#{game_name}&page=0&count=1&filter=games")
    page = Nokogiri::HTML(open(url))
    page.css('div.search-item-title').first.text.strip
  end
end