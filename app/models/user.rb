class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  validates :email, presence: true
  has_many :posts, foreign_key: :author_id
  has_many :roles, foreign_key: :id
end
