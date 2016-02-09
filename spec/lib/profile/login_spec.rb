require 'users/login'
require 'xbox_live_api'

describe Login do
  describe '.with' do
    let(:email) { 'email' }
    let(:password) { 'password' }
    let(:session_info) { double }
    let(:api) { double }
    context 'when login is successful' do
      before(:each) do
        allow(api).to receive(:session_info) { session_info }
        expect(XboxLiveApi).to receive(:login).with(email, password) { api }
      end
      it 'returns session info' do
        expect(Login.with(email, password)). to eql session_info
      end
    end
    context 'when login is unsuccessful' do
      before(:each) do
        expect(XboxLiveApi).to receive(:login).and_raise('error')
      end
      it 'raises an error' do
        msg = 'Unable to login'
        expect{ Login.with(email, password) }. to raise_error msg
      end
    end
  end
end