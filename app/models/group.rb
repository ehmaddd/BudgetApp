class Group < ApplicationRecord
  has_many :deal_groups
  has_many :deals, through: :deal_groups
end
