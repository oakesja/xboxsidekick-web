require 'achievements/gather_achievement_help'

describe GatherAchievementHelp do
  describe '.with' do
    let(:game) { 'AC Liberation HD' }
    let(:achievement) { 'Swamp Queen' }
    context 'when achievement help exists for a given game and achievement' do
      let(:results) { GatherAchievementHelp.with(game, achievement) }
      it 'contains results from xboxachievements.com' do
        url = 'http://www.xboxachievements.com/game/assassins-creed-liberation-hd/achievement/85371-Swamp-Queen.html'
        attrs = {name: XboxAchievementScraper.new.name, url: url, icon: XboxAchievementScraper.new.icon}
        expect(results).to include attrs
      end
      it 'contains results from trueachievements.com' do
        url = 'http://www.trueachievements.com/a183734/swamp-queen-achievement.htm'
        attrs = {name: TrueAchievementScraper.new.name, url: url, icon: TrueAchievementScraper.new.icon}
        expect(results).to include attrs
      end
    end
    context 'when no achievement help exists' do
      before(:each) do
        GatherAchievementHelp::SCRAPERS.each do |s|
          mock = double
          expect(s).to receive(:new) { mock }
          expect(mock).to receive(:scrape_achievement_help) { {} }
        end
      end
      it 'should return an empty array' do
        expect(GatherAchievementHelp.with(game, achievement)).to be_empty
      end
    end
  end
end