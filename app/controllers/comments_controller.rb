class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    authorize @comment
    if @comment.save
      redirect_to @post, notice: "Successfully saved comment."
    else
      redirect_to @post, notice: 'Error saving comment.'
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.approve!
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Successfully approved comment.'
    else
      redirect_to @post, notice: 'Error approving comment.'
    end
  end

  def destroy
    set_comment
    @post = @comment.post
    if @comment.destroy
      redirect_to @post, notice: 'Deleted comment'
    else
      redirect_to @post, notice: 'Error deleting comment'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
  end

private

  def set_comment
    @comment = Comment.find(params[:id]) 
  end

  def comment_params
    params.require(:comment).permit(:context, (:approved if CommentPolicy.new(current_user, @comment).approver?), :post_id, :created_at, :updated_at)
  end
end
