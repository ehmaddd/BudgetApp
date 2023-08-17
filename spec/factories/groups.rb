FactoryBot.define do
  factory :group do
    name { Faker::Company.name }
    user
    icon { 'default_icon.png' }
  end
end
