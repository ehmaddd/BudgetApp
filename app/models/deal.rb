class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :deal_groups
  has_many :groups, through: :deal_groups
end
