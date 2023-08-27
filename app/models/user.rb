class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_default_role

  has_many :posts
  has_many :comments

  def admin?
    role == 'admin'
  end

  private

  def set_default_role
    self.role ||= 'user'
  end
end
