class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :restrict_with_exception
  has_many :categories, dependent: :restrict_with_exception
end
