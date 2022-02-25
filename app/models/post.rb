class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :topic

  validates :name, presence: true
  validates :body, presence: true

  def self.search(query)
    return all if query.blank?

    where('LOWER(name) LIKE ?', "%#{query.downcase}%")
  end
end
