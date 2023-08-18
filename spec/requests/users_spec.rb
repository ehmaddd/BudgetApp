# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) } # Assuming you're using FactoryBot for user creation
  let(:new_name) { 'New Name' }

  describe 'registration and authentication' do
    it 'registers a new user and logs in' do
      post user_registration_path, params: { user: { email: 'test@example.com', password: 'password' } }
      follow_redirect!
      expect(response).to render_template(:index) # Redirects to authenticated_root_path
      expect(response.body).to include('Welcome') # Verify content on the redirected page
    end

    it 'logs in an existing user' do
      user = create(:user) # Use your factory or helper method to create a user
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      follow_redirect! # Follow the redirection after login
      expect(response).to render_template(:index) # Verify the redirection
      expect(response.body).to include('CATEGORIES') # Verify content on the redirected page
    end

    it 'logs out a user' do
      user = create(:user)
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      delete destroy_user_session_path
      follow_redirect!
      expect(response).to render_template(:index) # Redirects to unauthenticated_root_path
      expect(response.body).to include('W E L C O M E') # Verify content on the redirected page
    end
  end

  describe 'updating user attributes' do
    context 'updating user attributes' do
      it 'fails to update user name when not logged in' do
        put user_registration_path, params: { user: { name: new_name } }

        expect(response).to redirect_to(new_user_session_path)
        expect(user.reload.name).not_to eq(new_name)
      end
    end
  end
end
