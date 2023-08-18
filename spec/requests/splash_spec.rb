require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET /' do
    context 'when user is authenticated' do
      let(:user) { create(:user) } # Assuming you have a User factory

      before do
        sign_in user
      end
    end

    context 'when user is not authenticated' do
      it 'renders the splash page' do
        get unauthenticated_root_path
        expect(response).to render_template(:index)
      end

      it 'displays sign up and log in links' do
        get unauthenticated_root_path
        expect(response.body).to include('SIGN UP')
        expect(response.body).to include('LOG IN')
      end
    end
  end
end
