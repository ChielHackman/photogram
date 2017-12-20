class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented the hell out of that post!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def find_post
    @post = Post.find(params[:post_id])
  end
end
