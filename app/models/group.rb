class Group < ApplicationRecord
  belongs_to :user
  has_many :deal_groups
  has_many :deals, through: :deal_groups

  attr_accessor :total_amount
end
