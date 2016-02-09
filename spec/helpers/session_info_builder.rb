require 'xbox_live_api'

class SessionInfoBuilder
  class << self
    def build(user_id: 'id', gamertag: 'gamertag', token: 'token')
      XboxLiveApi::SessionInfo.new(user_id: user_id, gamertag: gamertag, token: token)
    end
  end
end