require 'nokogiri'
require 'open-uri'
require 'achievements/scrapers/scraper'

class TrueAchievementScraper < Scraper
  BASE_URL = 'http://www.trueachievements.com'

  def name
    'TrueAchievements'
  end

  def icon
    'http://www.trueachievements.com/images/TA_podcast.png'
  end

  private
  def game_url(game_name)
    "#{BASE_URL}/#{game_name}/achievements.htm"
  end

  def achievement_links_from(page)
    page.css('a.mainlink')
  end

  def achievement_name_from(achievement_link)
    achievement_link.text.strip.downcase!
  end

  def achievement_url_from(achievement_link)
    "#{BASE_URL}#{achievement_link['href']}"
  end
end