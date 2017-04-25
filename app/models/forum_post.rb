class ForumPost < ApplicationRecord

  validates :content, :presence => true


  belongs_to :user
  belongs_to :forum_thread
end
