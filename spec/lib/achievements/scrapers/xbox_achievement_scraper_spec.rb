require 'achievements/scrapers/xbox_achievement_scraper'

describe XboxAchievementScraper do
  let(:game_name) { 'the-witcher-3-wild-hunt' }
  let(:subject) { XboxAchievementScraper.new }
  describe '#scrape_game_url' do
    it 'returns the games url for a given games' do
      url = 'http://www.xboxachievements.com/game/the-witcher-3-wild-hunt/achievements/'
      expect(subject.scrape_game_url(game_name)).to eql url
    end
  end
  describe '#scrape_achievement_help' do
    context 'when the achievements exists' do
      let(:achievement_name) { 'Let\'s Cook!' }
      it 'returns the achievements url for the given games and achievements' do
        url = 'http://www.xboxachievements.com/game/the-witcher-3-wild-hunt/achievement/100610-Let-s-Cook-.html'
        icon = 'http://www.xboxachievements.com/apple-touch-icon.png'
        expected = {name: 'XboxAchievements', url: url, icon: icon}
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