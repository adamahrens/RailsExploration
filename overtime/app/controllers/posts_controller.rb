class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Post created successfully'
    else
      # Otherwise an error occurred
      render :new
    end
  end

  def show
  end

  def edit
    # Uses the PostPolicy to validate
    authorize @post
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'Post removed successfully'
    else
      render :index
    end
  end

  def update
    # Uses the PostPolicy to validate
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Post created successfully'
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale, :status)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
