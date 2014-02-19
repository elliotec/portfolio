class CommentsController < ApplicationController
  before_filter :load_commentable
  def index
    @post = Post.find(params[:post_id])
    @project = Project.find(project_params)
    @comments = @commentable.comments
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @commentable.comments.new
    authorize @comment

  end

  def create
    @comment = @commentable.comments.new(comment_params)

    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.build(comment_params)
    #authorize @comment


    if @comment.save
      redirect_to @commentable, notice: "Successfully saved comment."
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
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
    @comment = @commentable.comments.finde(params[:id])
  end

private

  def set_comment
    @comment = Comment.find(params[:id]) 
  end

  def comment_params
    params.require(:comment).permit(:context, (:approved if CommentPolicy.new(current_user, @comment).approver?), :created_at, :updated_at, :locale, :commentable_id, :author)
  end

  def load_commentable
    @resource, id = request.path.split('/')[2,3]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
