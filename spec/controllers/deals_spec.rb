# spec/controllers/deals_controller_spec.rb

require 'rails_helper'

RSpec.describe DealsController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index, params: { group_id: group.id }
      expect(response).to render_template(:index)
    end

    it "assigns the deals and total_amount variables" do
      deal = create(:deal, author: user, groups: [group])
      get :index, params: { group_id: group.id }
      expect(assigns(:deals)).to eq([deal])
      expect(assigns(:total_amount)).to eq(deal.amount)
    end

    it "only shows deals for the current user" do
      other_user = create(:user)
      other_group = create(:group, user: other_user)
      other_deal = create(:deal, author: other_user, groups: [other_group])

      get :index, params: { group_id: group.id }

      expect(assigns(:deals)).to_not include(other_deal)
    end

    it "creates a new deal" do
      deal_params = attributes_for(:deal)
      expect {
        post :create, params: { group_id: group.id, deal: deal_params }
      }.to change(Deal, :count).by(1)
    end

    it "associates the new deal with the group" do
      deal_params = attributes_for(:deal)
      post :create, params: { group_id: group.id, deal: deal_params }

      created_deal = Deal.last
      expect(created_deal.groups).to include(group)
    end

    it "redirects to group_deals_path on successful create" do
      deal_params = attributes_for(:deal)
      post :create, params: { group_id: group.id, deal: deal_params }

      expect(response).to redirect_to(group_deals_path(group))
      expect(flash[:notice]).to eq('Deal was successfully created.')
    end
  end
end
