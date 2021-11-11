class Category < ApplicationRecord
  belongs_to :user
  has_many :categorizations
  has_many :topics, through: :categorizations
end
