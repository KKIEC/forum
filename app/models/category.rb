class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :categorizations
  has_many :topics, through: :categorizations

  validates :name, presence: true

end
