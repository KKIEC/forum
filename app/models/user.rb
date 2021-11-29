class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :restrict_with_exception
  has_many :categories, dependent: :restrict_with_exception

  enum role: %i[novice member admin], _default: 'novice'

  validates :name, presence: true, uniqueness: true

end
