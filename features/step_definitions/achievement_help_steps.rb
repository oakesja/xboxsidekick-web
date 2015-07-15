require 'achievements/gather_achievement_help'

Given(/^I have a game$/) do
  @game_name = 'AC Liberation HD'
end

Given(/^I have an achievement for that game$/) do
  @achievement_name = 'Swamp Queen'
end

Given(/^achievement help sources cannot be reached$/) do
  GatherAchievementHelp::SCRAPERS.each { |s| mock_scraper(s) }
end

When(/^I gather a list of help for this achievement$/) do
  @achievement_help_list = GatherAchievementHelp.with(@game_name, @achievement_name)
end

Then(/^the list should include results from xboxachievements\.com$/) do
  url = 'http://www.xboxachievements.com/game/assassins-creed-liberation-hd/achievement/85371-Swamp-Queen.html'
  attrs = {name: XboxAchievementScraper::NAME, url: url, icon: XboxAchievementScraper::ICON}
  expect(@achievement_help_list).to include attrs
end

Then(/^the list should include results from trueachievements\.com$/) do
  url = 'http://www.trueachievements.com/a183734/swamp-queen-achievement.htm'
  attrs = {name: TrueAchievementScraper::NAME, url: url, icon: TrueAchievementScraper::ICON}
  expect(@achievement_help_list).to include attrs
end

Then(/^the list should be empty$/) do
  expect(@achievement_help_list).to be_empty
end

def mock_scraper(scraper)
  mock = double
  expect(scraper).to receive(:new) { mock }
  expect(mock).to receive(:scrape_achievement_help) { {} }
end

