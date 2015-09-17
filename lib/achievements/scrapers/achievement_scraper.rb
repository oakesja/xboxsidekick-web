require 'nokogiri'
require 'open-uri'

class AchievementScraper
  def scrape_game_url(game_name)
    URI.escape(game_url(game_name))
  end

  def scrape_achievement_help(game_name, achievement_name)
    page = Nokogiri::HTML(open(scrape_game_url(game_name)))
    achievement_links = achievement_links_from(page)
    url = find_achievement_url(achievement_name, achievement_links)
    url.empty? ? {} : {name: name, url: url, icon: icon}
  end

  private
  def game_url(game_name)
    raise NotImplementedError
  end

  def achievement_links_from(page)
    raise NotImplementedError
  end

  def find_achievement_url(achievement_name, achievement_links)
    index = achievement_links.find_index { |link| achievement_name_from(link) == achievement_name.downcase }
    index ? achievement_url_from(achievement_links[index]) : ''
  end

  def achievement_name_from(achievement_link)
    raise NotImplementedError
  end

  def achievement_url_from(achievement_link)
    raise NotImplementedError
  end
end