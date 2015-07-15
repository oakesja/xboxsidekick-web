require 'games/scrapers/game_name_scraper'

describe GameNameScraper do
  let(:subject) { GameNameScraper.new }
  describe 'lookup_game_name' do
    it 'should lookup the full games name' do
      [
          ['AC Liberation HD', 'Assassin\'s Creed Liberation HD'],
          ['Halo 3', 'Halo 3'],
          ['Mass Effect', 'Mass Effect'],
      ].each do |name, expected|
        expect(subject.lookup_game_name(name)).to eql expected
      end
    end
  end
end