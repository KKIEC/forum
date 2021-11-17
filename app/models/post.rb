class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :name, presence: true
  validates :body, presence: true

end
