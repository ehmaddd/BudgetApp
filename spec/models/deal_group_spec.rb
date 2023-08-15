# spec/models/deal_group_spec.rb
require 'rails_helper'

RSpec.describe DealGroup, type: :model do
  it 'belongs to a deal' do
    deal = FactoryBot.create(:deal)
    deal_group = FactoryBot.create(:deal_group, deal:)
    expect(deal_group.deal).to eq(deal)
  end

  it 'belongs to a group' do
    group = FactoryBot.create(:group)
    deal_group = FactoryBot.create(:deal_group, group:)
    expect(deal_group.group).to eq(group)
  end
end
