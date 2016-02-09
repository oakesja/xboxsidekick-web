class Login
  class << self
    def with(email, password)
      msg = 'Unable to login'
      XboxLiveApi.login(email, password).session_info rescue raise msg
    end
  end
end