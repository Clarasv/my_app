class User < ApplicationRecord
  #gem bcrypt
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  has_many :relevances, foreign_key: :following_id
  has_many :followings, through: :relevances, source: :follower
  
  has_many :reverse_of_relevances, class_name: 'Relevance', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relevances, source: :following
end
