require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  context 'Logged in user' do
    let(:user) { create(:user, role: 'admin') }
    let(:category) { create(:category, user: user) }
    let(:valid_attributes) do
      {
        name: 'Valid category',
        user: user
      }
    end
    before(:each) do
      sign_in(user)
    end

    describe 'GET #index' do
      it 'gets index, returns status code 200' do
        get categories_url
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #show' do
      it 'gets show, returns status code 200' do
        get category_url(category)
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #new' do
      it 'gets new, returns status code 200' do
        get new_category_url
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET #edit' do
      it 'gets edit, returns status code 200' do
        get edit_category_url(category)
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      subject do
        post '/categories', params: { category: valid_attributes }
      end

      it 'creates new category' do
        expect { subject }.to change(Category, :count).by(1)
      end

      it 'shows newly created category' do
        category
        subject
        expect(response).to redirect_to(category_url(Category.last))
      end

      it 'flashes notice' do
        subject
        expect(flash[:notice]).to be_present
      end
    end

    describe 'PUT #update' do
      subject do
        put "/categories/#{category.id}", params: { category: valid_attributes }
      end

      it 'updates category and redirects to updated category' do
        subject
        expect(response).to redirect_to(category_url(category))
      end

      it 'updates category and flash notice' do
        subject
        expect(flash[:notice]).to be_present
      end
    end

    describe 'DELETE #destroy' do
      subject do
        delete "/categories/#{category.id}"
      end

      it 'destroys requested object' do
        category
        expect { subject }.to change(Category, :count).by(-1)
      end

      it 'destroys and flashes notice' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'destroys and redirects to categories' do
        subject
        expect(response).to redirect_to(categories_url)
      end
    end
  end
end
