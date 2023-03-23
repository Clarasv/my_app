class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {maximum: 140}
  validates :user_id, presence: true
end
