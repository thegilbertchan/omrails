class ForumPost < ApplicationRecord

  validates :user, presence: true
  validates :content, presence: true
  validates :forum_thread_id, presence: true
  
  belongs_to :user
  belongs_to :forum_thread
end
