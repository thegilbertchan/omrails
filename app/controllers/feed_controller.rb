class FeedController < ApplicationController
  def show
  		@forum_threads = ForumThread.where(user: current_user.all_following)
  end
end
