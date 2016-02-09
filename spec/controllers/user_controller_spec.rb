require 'rails_helper'
require 'users/login'
require 'xbox_live_api'

describe UserController do
  describe '#login' do
    let(:email) { 'email' }
    let(:password) { 'password' }
    it 'will login the user' do
      expect(Login).to receive(:with).with(email, password)
      post(:login, email: email, password: password)
      expect(response).to be_success
    end
    context 'it sets customs headers for session info' do
      let(:id) { 'id' }
      let(:gamertag) { 'gamertag' }
      let(:token) { 'token' }
      before(:each) do
        session_info = XboxLiveApi::SessionInfo.new(user_id: id, gamertag: gamertag, token: token)
        allow(Login).to receive(:with) { session_info }
        post(:login, email: email, password: password)
      end
      it 'will set the user\'s gamertag in a header' do
        expect(response.headers['Xbox-Live-Api-Gamertag']).to eq gamertag
      end
      it 'will set the user\'s id in a header' do
        expect(response.headers['Xbox-Live-Api-Id']).to eq id
      end
      it 'will set the user\'s token in a header' do
        expect(response.headers['Xbox-Live-Api-Token']).to eq token
      end
    end
  end
end