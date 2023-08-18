# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      existing_user = create(:user)
      user = build(:user, email: existing_user.email)
      expect(user).not_to be_valid
    end
  end

  describe 'password validation' do
    it 'is not valid without a password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end
  end

  describe 'changing password' do
    it 'is considered changing password when encrypted_password changes' do
      user = create(:user)
      user.password = 'new_password'
      expect(user).to be_changing_password
    end

    it 'is not considered changing password when encrypted_password does not change' do
      user = create(:user)
      user.name = 'Updated Name'
      expect(user).not_to be_changing_password
    end
  end
end
