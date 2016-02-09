require 'users/lookup_profile'
require 'helpers/session_info_builder'

describe LookupProfile do
  describe '.with' do
    let(:session_info) { SessionInfoBuilder.build }
    let(:api) { double }
    context 'when the lookup is successful' do
      before(:each) do
        allow(XboxLiveApi).to receive(:with_session_info).with(session_info) { api }
      end
      it 'looks up the profile for the current user' do
        expect(api).to receive(:get_profile)
        LookupProfile.with(session_info)
      end
    end
    context 'when the lookup is unsuccessful' do
      before(:each) do
        allow(XboxLiveApi).to receive(:with_session_info).and_raise('error')
      end
      it 'looks up the profile for the current user' do
        msg = "Unable to lookup profile information for #{session_info.user_id}"
        expect{ LookupProfile.with(session_info) }.to raise_error msg
      end
    end
  end
end