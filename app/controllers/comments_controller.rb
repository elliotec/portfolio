class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posts_path
    end
  end

  def comment_params
    params.require(:comment).permit(:author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :context, (:approved if CommentPolicy.new(current_user, @comment).approver?), :post_id, :created_at, :updated_at)
  end
end
