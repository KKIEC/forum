class Topic < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all()
    end
  end

end
