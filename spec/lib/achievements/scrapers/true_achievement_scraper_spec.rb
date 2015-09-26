require 'achievements/scrapers/true_achievement_scraper'

describe TrueAchievementScraper do
  let(:game_name) { 'the-witcher-3-wild-hunt' }
  let(:subject) { TrueAchievementScraper.new }
  describe '#scrape_game_url' do
    it 'returns the games url for a given games' do
      url = 'http://www.trueachievements.com/the-witcher-3-wild-hunt/achievements.htm'
      expect(subject.scrape_game_url(game_name)).to eql url
    end
  end
  describe '#scrape_achievement_help' do
    context 'when the achievements exists' do
      let(:achievement_name) { 'Let\'s Cook!' }
      it 'returns the achievements url for the given games and achievements' do
        url = 'http://www.trueachievements.com/a200112/lets-cook-achievement.htm'
        icon = 'http://www.trueachievements.com/images/TA_podcast.png'
        expected = {name: 'TrueAchievements', url: url, icon: icon}
        expect(subject.scrape_achievement_help(game_name, achievement_name)).to eql expected
      end
    end
    context 'when the achievements does not exist' do
      let(:achievement_name) { 'fojdsiajfs' }
      it 'returns an empty string' do
        expect(subject.scrape_achievement_help(game_name, achievement_name)).to be_empty
      end
    end
  end
end