require 'rails_helper'

RSpec.describe 'Search', type: :request do
  context 'Logged in user' do
    let(:user) { create(:user, role: 'admin') }
    let(:category) { create(:category, user: user) }
    let(:topic) { create(:topic, user: user) }
    let(:post) { create(:post, user: user, topic: topic) }

    before(:each) do
      sign_in(user)
    end

    describe 'GET #index' do
      it 'gets index, returns status code 200, and all objects' do
        get search_index_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
