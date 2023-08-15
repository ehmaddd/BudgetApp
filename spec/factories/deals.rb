FactoryBot.define do
  factory :deal do
    author { association :user }
    name { Faker::Commerce.product_name }
    amount { Faker::Number.decimal(l_digits: 2) }
  end
end
