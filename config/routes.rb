Rails.application.routes.draw do
  get 'games/:game_name/achievements/:achievement_name/help', to: 'achievement#help'
  post 'users/login', to: 'user#login'
end
