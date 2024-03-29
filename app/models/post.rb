class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :title, length: {maximum: 140, minimum: 1}
  validates :user_id, presence: true

end
