class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deals, foreign_key: :author_id
  has_many :deal_groups, through: :deals
  has_many :groups

  validates :name, presence: true, unless: :changing_password?

  private

  def changing_password?
    encrypted_password_changed?
  end
end
