require 'rails_helper'

RSpec.describe 'Topics', type: :request do
  context 'Logged in user' do
    let(:user) { create(:user, role: 'admin') }
    let(:topic) { create(:topic, user: user) }
    let(:valid_attributes) do
      {
        name: 'Valid category',
        description: 'Valid description',
        user: user
      }
    end
    before(:each) do
      sign_in(user)
    end

    describe 'GET #index' do
      it 'gets index, returns status code 200' do
        get topics_url
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #show' do
      it 'gets show, returns status code 200' do
        get topic_url(topic)
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #new' do
      it 'gets new, returns status code 200' do
        get new_topic_url
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #edit' do
      it 'gets edit, returns status code 200' do
        get edit_topic_url(topic)
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      it 'creates new topic' do
        expect { post '/topics', params: { topic: valid_attributes } }.to change(Topic, :count).by(1)
      end

      it 'shows newly created topic' do
        topic
        post '/topics', params: { topic: valid_attributes }
        expect(response).to redirect_to(topic_url(Topic.last))
      end

      it 'flashes notice' do
        post '/topics', params: { topic: valid_attributes }
        expect(flash[:notice]).to be_present
      end
    end

    describe 'PUT #update' do
      it 'updates topic and redirects to updated topic' do
        put "/topics/#{topic.id}", params: { topic: valid_attributes }
        expect(response).to redirect_to(topic_url(topic))
      end

      it 'updates topic and flash notice' do
        put "/topics/#{topic.id}", params: { topic: valid_attributes }
        expect(flash[:notice]).to be_present
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys requested object' do
        topic
        expect { delete "/topics/#{topic.id}" }.to change(Topic, :count).by(-1)
      end

      it 'destroys and flashes notice' do
        delete "/topics/#{topic.id}"
        expect(flash[:notice]).to be_present
      end

      it 'destroys and redirects to topics' do
        delete "/topics/#{topic.id}"
        expect(response).to redirect_to(topics_url)
      end
    end
  end
end
