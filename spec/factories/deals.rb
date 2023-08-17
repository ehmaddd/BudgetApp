FactoryBot.define do
  factory :deal do
    author { association :author_user }
    name { Faker::Commerce.product_name }
    amount { Faker::Number.decimal(l_digits: 2) }

    after(:create) do |deal|
      group = create(:group)
      create(:deal_group, deal: deal, group: group)
    end
  end
end
