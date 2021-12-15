class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :topic

  validates :name, presence: true
  validates :body, presence: true

end
