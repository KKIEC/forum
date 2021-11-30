require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'Logged in user' do
    let(:user) { create(:user, role: 'admin') }
    let(:topic) { create(:topic, user: user) }
    let(:item) { create(:item, user: user, topic: topic) }

    let(:valid_attributes) do
      {
        name: 'Valid post',
        body: 'Valid body',
        topic_id: topic.id,
        user: user
      }
    end
    before(:each) do
      sign_in(user)
    end

    describe 'GET #show' do
      it 'gets show, returns status code 200' do
        get post_url(item)
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #new' do
      it 'gets new, returns status code 200' do
        get new_post_url topic_ref: topic
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #edit' do
      it 'gets edit, returns status code 200' do
        get edit_post_url(item)
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      subject do
        post '/posts', params: { post: valid_attributes }
      end

      it 'creates new post' do
        expect { subject }.to change(Post, :count).by(1)
      end

      it 'back to topic-owner' do
        subject
        expect(response).to redirect_to(topic_url(topic))
      end

      it 'flashes notice' do
        subject
        expect(flash[:notice]).to be_present
      end
    end

    describe 'PUT #update' do
      subject do
        put "/posts/#{item.id}", params: { post: valid_attributes }
      end

      it 'updates post and redirects to owner-topic' do
        subject
        expect(response).to redirect_to(topic_url(topic))
      end

      it 'updates post and flash notice' do
        subject
        expect(flash[:notice]).to be_present
      end
    end

    describe 'DELETE #destroy' do
      subject do
        delete "/posts/#{item.id}"
      end

      it 'destroys requested object' do
        item
        expect { subject }.to change(Post, :count).by(-1)
      end

      it 'destroys and flashes notice' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'destroys and redirects to owner-topic' do
        subject
        expect(response).to redirect_to(topic_url(topic))
      end
    end
  end
end
