Rails.application.routes.draw do
  get 'games/:game_name/achievements/:achievement_name/help' => 'achievement#help'
end
