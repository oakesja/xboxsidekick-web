require 'nokogiri'
require 'open-uri'
require 'achievements/scrapers/achievement_scraper'

class XboxAchievementScraper < AchievementScraper
  BASE_URL = 'http://www.xboxachievements.com'

  def name
    'XboxAchievements'
  end

  def icon
    'http://www.xboxachievements.com/apple-touch-icon.png'
  end

  private
  def game_url(game_name)
    "#{BASE_URL}/game/#{game_name}/achievements/"
  end

  def achievement_links_from(page)
    page.css('td.ac2')
  end

  def achievement_name_from(achievement_link)
    achievement_link.css('a').first.text.strip.downcase!
  end

  def achievement_url_from(achievement_link)
    "#{BASE_URL}#{achievement_link.css('a').first['href']}"
  end
end