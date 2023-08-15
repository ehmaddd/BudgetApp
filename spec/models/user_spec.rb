# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many deals' do
    user = FactoryBot.create(:user)
    deal = FactoryBot.create(:deal, author: user)
    expect(user.deals).to include(deal)
  end

  it 'has many groups through deals' do
    user = FactoryBot.create(:user)
    deal = FactoryBot.create(:deal, author: user)
    group = FactoryBot.create(:group)
    deal.groups << group
    expect(user.groups).to include(group)
  end
end
