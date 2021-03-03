class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  
  def index
    @comment = Comment.new
    @post = Post.new
    @forum = Forum.find(params[:forum_id]) 
    @user = current_user
  end

  def create
    
    @post = Post.new(post_params)
    @forum = Forum.find(params[:forum_id]) 
    @post.user = current_user
    @post.forum = @forum


    if @post.save
      redirect_to city_forum_posts_path(@forum.city, @forum, @post)
    else
      render "posts/index"
    end
  end

  private 
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
