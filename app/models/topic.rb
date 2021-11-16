class Topic < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :posts, dependent: :destroy

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all()
    end
  end

end
