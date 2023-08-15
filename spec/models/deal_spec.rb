# spec/models/deal_spec.rb
require 'rails_helper'

RSpec.describe Deal, type: :model do
  it "belongs to an author (user)" do
    user = FactoryBot.create(:user)
    deal = FactoryBot.create(:deal, author: user)
    expect(deal.author).to eq(user)
  end

  it "is expected to have many deal_groups" do
    deal = FactoryBot.create(:deal)
    deal_group = FactoryBot.create(:deal_group, deal: deal)
    expect(deal.deal_groups).to include(deal_group)
  end

  it "is expected to have many groups through deal_groups" do
    deal = FactoryBot.create(:deal)
    group = FactoryBot.create(:group)
    deal_group = FactoryBot.create(:deal_group, deal: deal, group: group)
    expect(deal.groups).to include(group)
  end
end
