class ForumPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /forum_posts
  # GET /forum_posts.json
  def index
    forum_thread = ForumThread.find(params[:forum_thread_id])
    @forum_posts = forum_thread.forum_posts
  end
  
  # GET /forum_posts/1
  # GET /forum_posts/1.json
  def show
    #1st you retrieve the thread thanks to params[:forum_thread_id]
    @forum_post = ForumPost.find(params[:forum_thread_id])
    #2nd you retrieve the forum_post thanks to params[:id]
    @forum_posts = forum_thread.forum_post(params[:id])
  end

  # GET /forum_posts/new
  def new
    #1st you retrieve the post thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find(params[:forum_thread_id])
    #2nd you build a new one
    @forum_post = forum_thread.forum_posts.build
  end

  # GET /forum_posts/1/edit
  def edit
    @forum_post = current_user.forum_posts.find(params[:id])
  end

  # POST /forum_posts
  # POST /forum_posts.json
  def create
    @forum_post = current_user.forum_posts.new(forum_post_params)
    respond_to do |format|
      if @forum_post.save
        format.html { redirect_to @forum_post, notice: 'Forum post was successfully created.' }
        format.json { render :show, status: :created, location: @forum_post }
      else
        format.html { render :new }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
   end
  end

  # PATCH/PUT /forum_posts/1
  # PATCH/PUT /forum_posts/1.json
  def update
        @forum_post = current_user.forum_posts.find(params[:id])
    respond_to do |format|
      if @forum_post.update(forum_post_params)
        format.html { redirect_to @forum_post, notice: 'Forum post was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum_post }
      else
        format.html { render :edit }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_posts/1
  # DELETE /forum_posts/1.json
  def destroy
    @forum_post = current_user.forum_posts.find(params[:id])
    @forum_post.destroy
    respond_to do |format|
      format.html { redirect_to forum_posts_url, notice: 'Forum post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_post_params
      params.require(:forum_post).permit(:forum_thread_id, :content)
    end
end