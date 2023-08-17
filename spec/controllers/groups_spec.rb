# spec/controllers/groups_controller_spec.rb

require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { create(:group) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:group) { create(:group) } # Assuming you have a Factory setup

    it 'returns a successful response' do
      get :show, params: { id: group.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    let(:group) { create(:group) } # Assuming you have a Factory setup

    it 'returns a successful response' do
      get :edit, params: { id: group.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    let!(:group) { create(:group) } # Assuming you have a Factory setup
    let(:new_name) { 'New Group Name' }

    it 'updates the group' do
      patch :update, params: { id: group.id, group: { name: new_name } }
      expect(response).to have_http_status(:redirect)
      expect(group.reload.name).to eq(new_name)
    end
  end

  describe 'DELETE #destroy' do
    let!(:group) { create(:group) } # Assuming you have a Factory setup

    it 'destroys the group' do
      expect {
        delete :destroy, params: { id: group.id }
      }.to change(Group, :count).by(-1)
      expect(response).to have_http_status(:redirect)
    end
  end
end
