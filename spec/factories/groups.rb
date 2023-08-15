FactoryBot.define do
  factory :group do
    name { Faker::Company.name }
    icon { 'default_icon.png' }
  end
end
