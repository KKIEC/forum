class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  def self.search(query)
    return all.order('name ASC') if query.blank?

    where('LOWER(name) LIKE ?', "%#{query.downcase}%").order('name ASC')
  end
end
