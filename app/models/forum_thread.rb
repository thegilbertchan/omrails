class ForumThread < ApplicationRecord

validates :forum_post, :presence => true
validates :forum_post_id, :presence => true

  belongs_to :user
  has_many :forum_posts
end
