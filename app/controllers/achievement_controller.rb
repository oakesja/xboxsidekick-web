require 'achievements/gather_achievement_help'
require 'oj'

class AchievementController < ApplicationController
  def help
    # TODO add error handling
    render json: Oj.dump(GatherAchievementHelp.with(params[:game_name], params[:achievement_name]))
  end
end