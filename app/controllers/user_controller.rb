require 'users/login'

class UserController < ApplicationController
  def login
    session_info = Login.with(params[:email], params[:password])
    response.headers['Xbox-Live-Api-Gamertag'] = session_info.gamertag
    response.headers['Xbox-Live-Api-Id'] = session_info.user_id
    response.headers['Xbox-Live-Api-Token'] = session_info.token
    render json: {}
  end
end