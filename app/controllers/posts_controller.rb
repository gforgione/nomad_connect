class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  
  def index
    @comment = Comment.new
    @post = Post.new
    @city = City.find(params[:city_id])
    @forums = Forum.where(city_id: @city)
    @chatroom = Chatroom.find_by(forum_id: current_forum)
    @message = Message.new
  end

  def current_forum
    @current_forum ||= Forum.find(params[:forum_id]) 
    # special operator that sets this variable only if its not set yet. memoization
    # dont want to repeat requests for no reason espcially database requests because that will bottleneck your app
    # even if you call current forum 1000x times, it will just call this once
    # you would use htis if you were access current_forum in a lot of places
    # makes the instance variable accessible to your views and helpers
  end

  helper_method :current_forum # sometimes you can add this to application controller if you want to access it from whole app

  def create
  
    @post = Post.new(post_params)
    @forum = Forum.find(params[:forum_id]) 
    @post.user = current_user
    @post.forum = @forum


    if @post.save
      redirect_to city_forum_posts_path(@forum.city, @forum, @post, anchor: "post-#{@post.id}")
    else
      render "posts/index"
    end
  end

  private 
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
