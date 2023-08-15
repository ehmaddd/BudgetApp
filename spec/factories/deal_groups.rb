FactoryBot.define do
  factory :deal_group do
    association :deal
    association :group
  end
end
