class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {maximum: 140}
  validates :user_id, presence: true
  
  def user
    return User.find_by(id: self.user_id)
  end
end
