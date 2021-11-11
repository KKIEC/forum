class Topic < ApplicationRecord
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :posts, dependent: :destroy
end
