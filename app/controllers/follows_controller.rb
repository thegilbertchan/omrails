class FollowsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    user = User.find_by(username: params[:username])
  	Follow.create(followable: user, follower: current_user)
  	redirect_to user_path(user.username), notice: "Successfully folllowed user"
  end

  
  def destroy
  	user = User.find_by(username: params[:username])
  	Follow.find_by(followable: user, follower: current_user).destroy
  	redirect_to user_path(user.username), notice: "Successfully unfolllowed user"
  end
end



# class FollowsController < ApplicationController
#   before_action :authenticate_user!, except: [:index, :show]

#   def create
#     forum_thread = ForumThread.find_by(id: params[:id])
#     Follow.create(followable: forum_thread, follower: current_user)
#     redirect_to user_path(user.username), notice: "Successfully folllowed user"
#   end


#   def destroy
#     forum_thread = ForumThread.find_by(id: params[:id])
#     Follow.find_by(followable: forum_thread, follower: current_user)
#     redirect_to user_path(user.username), notice: "Successfully unfolllowed user"
#   end
# end
