require 'games/scrapers/game_name_scraper'
require 'achievements/scrapers/xbox_achievement_scraper'
require 'achievements/scrapers/true_achievement_scraper'

class GatherAchievementHelp
  SCRAPERS = [XboxAchievementScraper, TrueAchievementScraper]

  class << self
    def with(game_name, achievement_name)
      game_name = lookup_full_game_name(game_name)
      encode_game_name(game_name)
      gather_help(game_name, achievement_name)
    end

    private
    def lookup_full_game_name(game_name)
      GameNameScraper.new.lookup_game_name(game_name)
    end

    def encode_game_name(game_name)
      game_name.gsub!(/[^\w\s]/, '')
      game_name.gsub!(/\s/, '-')
      game_name.downcase!
    end

    def gather_help(game_name, achievement_name)
      help = SCRAPERS.collect { |scraper| scraper.new.scrape_achievement_help(game_name, achievement_name) }
      help.reject { |h| h.empty? }
    end
  end
end