class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:index, :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def publish
    @post = Post.find(params[:id])
    @post.published = true
    @post.save
    redirect_to posts_url, notice: 'Published!'
  end

  def edit  
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        current_user.posts << @post
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @resource, id = request.path.split('/')[2,3]
    end

    def post_params
      params.require(:post).permit(:title, :body, :locale, (:published if PostPolicy.new(current_user, @post).publish?))
    end

end
