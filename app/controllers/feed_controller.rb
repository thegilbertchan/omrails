class FeedController < ApplicationController
   before_action :authenticate_user!
  def show
  		@forum_threads = current_user.following_forum_threads
  		# @forum_threads = ForumThread.where(id:current_user.follows_by_type('ForumThread').map(&:followable_id))
  		# @forum_threads = current_user.follows_by_type('ForumThread').map{|d| ForumThread.find_by(id: d.followable_id)}

  end
end
