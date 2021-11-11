class User < ApplicationRecord
  belongs_to :role
  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :restrict_with_exception
  has_many :categories, dependent: :restrict_with_exception
end
