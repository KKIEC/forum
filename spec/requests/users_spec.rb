require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'Logged in user' do
    let(:user) { create(:user, role: 'admin') }
    let(:valid_attributes) do
      {
        name: 'Valid user',
        email: 'valid@example.com',
        password: 'xxxxxxxx',
        role: 'member'
      }
    end
    before(:each) do
      sign_in(user)
    end

    describe 'GET #index' do
      it 'gets index, returns status code 200' do
        get users_url
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #show' do
      it 'gets show, returns status code 200' do
        get user_url(user)
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #new' do
      it 'gets new, returns status code 200' do
        get new_user_url
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #edit' do
      it 'gets edit, returns status code 200' do
        get edit_user_url(user)
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      subject do
        post '/admin/users', params: { user: valid_attributes }
      end

      it 'creates new user' do
        expect { subject }.to change(User, :count).by(1)
      end

      it 'shows newly created user' do
        subject
        expect(response).to redirect_to(user_url(User.last))
      end

      it 'flashes notice' do
        subject
        expect(flash[:notice]).to be_present
      end
    end

    describe 'PUT #update' do
      subject do
        put "/admin/users/#{user.id}", params: { user: valid_attributes }
      end

      it 'updates user and redirects to updated user' do
        subject
        expect(response).to redirect_to(user_url(user))
      end

      it 'updates user and flash notice' do
        subject
        expect(flash[:notice]).to be_present
      end
    end

    describe 'DELETE #destroy' do
      subject do
        delete "/admin/users/#{user.id}"
      end

      it 'destroys requested object' do
        expect { subject }.to change(User, :count).by(-1)
      end

      it 'destroys and flashes notice' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'destroys and redirects to users' do
        subject
        expect(response).to redirect_to(users_url)
      end
    end
  end
end
