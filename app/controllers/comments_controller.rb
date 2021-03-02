class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @forum = @post.forum
    
    @comment.post = @post
    @comment.user = current_user
    
    if @comment.save
      
      redirect_to city_forum_posts_path(@forum.city, @forum, anchor: "post-#{@post.id}")
    else
      render "posts/index"
    end

  end

  private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
