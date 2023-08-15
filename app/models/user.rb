class User < ApplicationRecord
  has_many :deals, foreign_key: :author_id
  has_many :groups, through: :deals
end
