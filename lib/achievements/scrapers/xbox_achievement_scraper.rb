require 'nokogiri'
require 'open-uri'

class XboxAchievementScraper
  BASE_URL = 'http://www.xboxachievements.com'
  NAME = 'XboxAchievements'
  ICON = 'http://www.xboxachievements.com/apple-touch-icon.png'

  def scrape_game_url(game_name)
    URI.escape("#{BASE_URL}/game/#{game_name}/achievements/")
  end

  def scrape_achievement_help(game_name, achievement_name)
    page = Nokogiri::HTML(open(scrape_game_url(game_name)))
    achievement_links = page.css('td.ac2')
    url = find_achievement_url(achievement_name, achievement_links)
    url.empty? ? {} : {name: NAME, url: url, icon: ICON}
  end

  private
  def find_achievement_url(achievement_name, achievement_links)
    index = achievement_links.find_index { |link| achievement_name_from(link) == achievement_name.downcase }
    index ? "#{BASE_URL}#{achievement_links[index].css('a').first['href']}" : ''
  end

  def achievement_name_from(link)
    link.css('a').first.text.strip.downcase
  end
end