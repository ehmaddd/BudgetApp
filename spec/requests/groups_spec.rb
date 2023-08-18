# spec/requests/groups_spec.rb
require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:group) }
  let(:invalid_attributes) { attributes_for(:group, name: nil) }

  before do
    sign_in user
  end

  describe 'GET /groups' do
    it 'displays a list of groups' do
      group = create(:group, user:)
      get groups_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(group.name)
    end
  end

  describe 'GET /groups/:id' do
    it 'displays a group' do
      group = create(:group, user:)
      get group_path(group)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(group.name)
    end
  end

  describe 'GET /groups/new' do
    it 'displays the new group form' do
      get new_group_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('New Group')
    end
  end
end
