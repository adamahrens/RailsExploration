class BlogsController < ApplicationController
  before_action :set_blog,   only: %i[edit update destroy publicize]
  before_action :set_topics, only: %i[index new edit show create]
  layout 'blog'
  access all: %i[show index],
         user: { except: %i[new create update edit destroy] },
         site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    if logged_in?(:site_admin)
      @blogs = Blog.chapter(params[:chapter]).recent
    else
      @blogs = Blog.published.chapter(params[:chapter]).recent
    end

    @featured = Blog.last
    @page_title += ' | My Blog'
  end

  def publicize
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_path, notice: 'Blog status was updated'
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    if logged_in?(:site_admin) || @blog.published?
      @comment = Comment.new
      @page_title = @blog.title
    else
      redirect_to blogs_path, notice: 'Not authorized to view'
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.topic = Topic.find(blog_params[:topic_id])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was removed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    # @blog = Blog.find(params[:id])
    @blog = Blog.friendly.find(params[:id])
  end

  def set_topics
    # Sorts but the count of topics used on blogs
    @topics = Topic.left_joins(:blogs).where.not(blogs: { id: nil} ).group(:id).order('COUNT(blogs.id) DESC')
  end

  # Never trust parameters from the internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id)
  end
end
