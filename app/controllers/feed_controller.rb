class FeedController < ApplicationController
   before_action :authenticate_user!
  def show
  		@forum_threads = ForumThread.where(user: current_user.all_following)
  end
end
