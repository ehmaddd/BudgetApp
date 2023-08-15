class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups, through: :deal_groups
end
