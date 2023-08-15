# spec/models/group_spec.rb
require 'rails_helper'

RSpec.describe Group, type: :model do
  it "is expected to have many deal_groups" do
    group = FactoryBot.create(:group)
    deal_group = FactoryBot.create(:deal_group, group: group)
    expect(group.deal_groups).to include(deal_group)
  end

  it "is expected to have many deals through deal_groups" do
    group = FactoryBot.create(:group)
    deal = FactoryBot.create(:deal)
    deal_group = FactoryBot.create(:deal_group, group: group, deal: deal)
    expect(group.deals).to include(deal)
  end
end
