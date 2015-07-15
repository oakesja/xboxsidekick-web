require 'nokogiri'
require 'open-uri'

class TrueAchievementScraper
  BASE_URL = 'http://www.trueachievements.com'
  NAME = 'TrueAchievements'
  ICON = 'http://www.trueachievements.com/images/TA_podcast.png'

  def scrape_game_url(game_name)
    URI.escape("#{BASE_URL}/#{game_name}/achievements.htm")
  end

  def scrape_achievement_help(game_name, achievement_name)
    page = Nokogiri::HTML(open(scrape_game_url(game_name)))
    achievement_links = page.css('a.mainlink')
    url = find_achievement_url(achievement_name, achievement_links)
    url.empty? ? {} : {name: NAME, url: url, icon: ICON}
  end

  private
  def find_achievement_url(achievement_name, achievement_links)
    index = achievement_links.find_index { |link| achievement_name_from(link) == achievement_name.downcase }
    index ? "#{BASE_URL}#{achievement_links[index]['href']}" : ''
  end

  def achievement_name_from(link)
    link.text.strip.downcase
  end
end