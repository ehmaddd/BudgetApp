FactoryBot.define do
  factory :group do
    name { Faker::Company.name }
    association :user
    icon { 'default_icon.png' }
  end
end
