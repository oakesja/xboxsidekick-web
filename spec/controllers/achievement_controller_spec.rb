require 'rails_helper'
require 'achievements/gather_achievement_help'

RSpec.describe AchievementController do
  describe '#help' do
    let(:game_name) { 'game' }
    let(:achievement_name) { 'achievement' }
    it 'should return a json list of help' do
      expect(GatherAchievementHelp).to receive(:with).with(game_name, achievement_name) { [] }
      get(:help, game_name: game_name, achievement_name: achievement_name)
      expect(response).to be_success
      expect(response.body).to eql '[]'
    end
  end
end