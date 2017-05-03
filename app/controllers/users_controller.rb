class UsersController < ApplicationController
  def show
  		@user = User.find_by(username: params[:username])
  		@forum_threads = @user.forum_threads
  end
end
