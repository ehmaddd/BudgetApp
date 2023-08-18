require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'GET #new' do
    context 'when user is not signed in' do
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'signs out the user and redirects to unauthenticated_root_url' do
      user = create(:user) # Assuming you have a valid user factory
      sign_in(user)

      delete :destroy
      expect(session[:user_id]).to be_nil # Check if user_id session is cleared

      expect(response).to redirect_to(unauthenticated_root_url)
    end
  end

  # Test scenarios for after_sign_in_path_for can be added here as well
end
