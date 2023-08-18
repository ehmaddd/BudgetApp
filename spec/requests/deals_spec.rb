require 'rails_helper'

RSpec.describe 'Deals', type: :request do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  let(:valid_attributes) { attributes_for(:deal) }

  describe 'GET /groups/:group_id/deals' do
    it 'returns a success response' do
      sign_in user
      get group_deals_path(group)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /groups/:group_id/deals/new' do
    it 'returns a success response' do
      sign_in user
      get new_group_deal_path(group)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /groups/:group_id/deals' do
    let(:valid_attributes) { attributes_for(:deal) }

    context 'when user is logged in' do
      it 'creates a new deal' do
        sign_in user
        expect {
          post group_deals_path(group), params: { deal: valid_attributes }
        }.to change(Deal, :count).by(1)
      end
    end
  end
end
