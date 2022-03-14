class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  has_many :posts, dependent: :nullify
  has_many :topics, dependent: :nullify
  has_many :categories, dependent: :nullify

  enum role: %i[novice member admin], _default: 'novice'

  validates :name, presence: true, uniqueness: true
  validate :at_least_one_admin, on: :update

  def at_least_one_admin
    user = User.find(id)
    cond1 = User.admin.count <= 1
    cond2 = user.role == 'admin'
    return unless cond1 && cond2 && ((role == 'member') || (role == 'novice'))

    errors.add :base, :invalid, message: 'You are the last admin!!!'
  end

  def self.search(query)
    return all.order('name ASC') if query.blank?

    where('LOWER(name) LIKE ?', "%#{query.downcase}%").order('name ASC')
  end
end
