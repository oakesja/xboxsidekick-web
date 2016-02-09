require 'xbox_live_api'

class LookupProfile
  class << self
    def with(session_info)
      msg = "Unable to lookup profile information for #{session_info.user_id}"
      XboxLiveApi.with_session_info(session_info).get_profile rescue raise msg
    end
  end
end