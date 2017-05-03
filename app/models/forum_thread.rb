class ForumThread < ApplicationRecord

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true
  
  
  belongs_to :user
  has_many :forum_posts
  acts_as_followable

end
