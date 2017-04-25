class ForumPostsController < ApplicationController
  # GET /forum_threads/:forum_thread_id/forum_posts
  # GET /forum_threads/:forum_thread_id/forum_posts.xml
  def index
    #1st you retrieve the forum_thread thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find (params[:forum_thread_id])
    #2nd you get all the forum_posts of this forum_thread
    @forum_posts = forum_thread.forum_posts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forum_posts }
    end
  end

  # GET /forum_threads/:forum_thread_id/forum_posts/:id
  # GET /forum_posts/:id.xml
  def show
    #1st you retrieve the forum_thread thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find(params[:forum_thread_id])
    #2nd you retrieve the forum_post thanks to params[:id]
    @forum_post = forum_thread.forum_posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forum_post }
    end
  end

  # GET /forum_threads/:forum_thread_id/forum_posts/new
  # GET /forum_threads/:forum_thread_id/forum_posts/new.xml
  def new
    #1st you retrieve the forum_thread thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find (params[:forum_thread_id])
    #2nd you build a new one
    @forum_post = forum_thread.forum_posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forum_post }
    end
  end

  # GET /forum_threads/:forum_thread_id/forum_posts/:id/edit
  def edit
    #1st you retrieve the forum_thread thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find (params[:forum_thread_id])
    #2nd you retrieve the forum_post thanks to params[:id]
    @forum_post = forum_thread.forum_posts.find(params[:id])
  end

  # forum_thread /forum_threads/:forum_thread_id/forum_posts
  # forum_thread /forum_threads/:forum_thread_id/forum_posts.xml
  def create
    #1st you retrieve the forum_thread thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find (params[:forum_thread_id])
    #2nd you create the forum_post with arguments in params[:forum_post]
    @forum_post = forum_thread.forum_posts.create(params[:forum_post])

    respond_to do |format|
      if @forum_post.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource forum_post
        format.html { redirect_to([@forum_post.forum_thread, @forum_post], :notice => 'forum_post was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource forum_post
        format.xml  { render :xml => @forum_post, :status => :created, :location => [@forum_post.forum_thread, @forum_post] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forum_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forum_threads/:forum_thread_id/forum_posts/:id
  # PUT /forum_threads/:forum_thread_id/forum_posts/:id.xml
  def update
    #1st you retrieve the forum_thread thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find (params[:forum_thread_id])
    #2nd you retrieve the forum_post thanks to params[:id]
    @forum_post = forum_thread.forum_posts.find(params[:id])

    respond_to do |format|
      if @forum_post.update_attributes(params[:forum_post])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource forum_post
        format.html { redirect_to([@forum_post.forum_thread, @forum_post], :notice => 'forum_post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forum_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_threads/:forum_thread_id/forum_posts/1
  # DELETE /forum_threads/:forum_thread_id/forum_posts/1.xml
  def destroy
    #1st you retrieve the forum_thread thanks to params[:forum_thread_id]
    forum_thread = ForumThread.find (params[:forum_thread_id])
    #2nd you retrieve the forum_post thanks to params[:id]
    @forum_post = forum_thread.forum_posts.find(params[:id])
    @forum_post.destroy

    respond_to do |format|
      #1st argument reference the path /forum_threads/:forum_thread_id/forum_posts/
      format.html { redirect_to(forum_thread_forum_posts_url) }
      format.xml  { head :ok }
    end
  end
end