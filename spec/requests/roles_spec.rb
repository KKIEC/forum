require 'rails_helper'

RSpec.describe 'Roles management', type: :request do
  context 'Logged in user' do
    before(:each) do
      r1 = Role.create!(name: 'Admin', description: 'Desc')
      user = User.create!(name: 'Test user', email: 'test@example.com', password: 'xxxxxxxx', role_id: r1.id)
      sign_in(user)
    end

    context 'GET #index' do
      it 'should get index, return status code 200' do
        get roles_url
        expect(response).to have_http_status(200)
      end
    end

    context 'GET #show' do
      it 'should get show, return status code 200' do
        r1 = Role.find_by name: 'Admin'
        get role_url(r1)
        expect(response).to have_http_status(200)
      end
    end

    context 'GET #new' do
      it 'should get new, return status code 200' do
        get new_role_url
        expect(response).to have_http_status(200)
      end
    end

    context 'GET #edit' do
      it 'should get edit, return status code 200' do
        r1 = Role.find_by name: 'Admin'
        get edit_role_url(r1)
        expect(response).to have_http_status(200)
      end
    end

    context 'POST #create' do
      let(:valid_attributes) do
        {
          name: 'Member',
          description: 'About member role'
        }
      end

      it 'should create new role' do
        expect { post '/roles', params: { role: valid_attributes } }.to change(Role, :count).by(1)
      end

      it 'should show newly created role' do
        post '/roles', params: { role: valid_attributes }
        expect(response).to redirect_to(role_url(Role.last))
      end

      it 'should flash notice' do
        post '/roles', params: { role: valid_attributes }
        expect(flash[:notice]).to be_present
      end
    end

    context 'PUT #update' do
      let(:valid_attributes) do
        {
          name: 'Member',
          description: 'About member role'
        }
      end

      it 'should update a role and redirect to updated role' do
        r1 = Role.find_by name: 'Admin'
        put "/roles/#{r1.id}", params: { role: valid_attributes }
        r1 = Role.find_by name: 'Member'
        expect(response).to redirect_to(role_url(r1))
      end

      it 'should update and flash notice' do
        r1 = Role.find_by name: 'Admin'
        put "/roles/#{r1.id}", params: { role: valid_attributes }
        expect(flash[:notice]).to be_present
      end
    end

    context 'DELETE #destroy' do
      before(:each) do
        Role.create!(name: 'Test role', description: 'Desc')
      end

      it 'should destroy requested object' do
        r2 = Role.find_by name: 'Test role'
        expect { delete "/roles/#{r2.id}" }.to change(Role, :count).by(-1)
      end

      it 'should destroy and flash notice' do
        r2 = Role.find_by name: 'Test role'
        delete "/roles/#{r2.id}"
        expect(flash[:notice]).to be_present
      end

      it 'should destroy and redirect to roles' do
        r2 = Role.find_by name: 'Test role'
        delete "/roles/#{r2.id}"
        expect(response).to redirect_to(roles_url)
      end
    end
  end
end
