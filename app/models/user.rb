class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, optional: true
  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :restrict_with_exception
  has_many :categories, dependent: :restrict_with_exception

  validates :name, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'User' if role.nil?
  end

end
