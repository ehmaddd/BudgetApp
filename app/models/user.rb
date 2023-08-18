class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deals, foreign_key: :author_id
  has_many :deal_groups, through: :deals
  has_many :groups

  validates :name, presence: true, unless: :changing_password?

  def changing_password?
    encrypted_password_changed?
  end

  attr_accessor :name # Add this line to include the virtual attribute

  # Include the necessary methods for Devise to recognize the attribute
  def self.attributes_protected_by_default
    super + ['name']
  end

  # Override Devise's default parameter sanitizer to include :name
  def self.devise_parameter_sanitizer
    return unless respond_to?(:default_params)

    default_params.permit(:name, :email, :password, :password_confirmation)
  end
end
