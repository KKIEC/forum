class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :nullify
  has_many :topics, dependent: :nullify
  has_many :categories, dependent: :nullify

  enum role: %i[novice member admin], _default: 'novice'

  validates :name, presence: true, uniqueness: true
  validate :at_least_one_admin, on: :update

  def at_least_one_admin
    return unless (User.admin.count <= 1) && ((role == 'member') || (role == 'novice'))

    errors.add :base, :invalid, message: 'You are the last admin!!!'
  end
end
