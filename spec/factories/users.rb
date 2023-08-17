FactoryBot.define do
  factory :user do
    factory :author_user do
      after(:create) do |user|
        create(:group, user: user)
      end
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
