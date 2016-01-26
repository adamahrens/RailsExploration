class PostsController < ApplicationController
	def index
		@posts = Post.all
		Rails.logger.debug "Found #{@posts.count} posts"
		Rails.logger.debug "Inspect #{@posts.inspect}"
	end

	def new
		@post = Post.new
		Rails.logger.debug "Creating a new Post for the form"
	end

	def create
		Rails.logger.debug "Got these Post params #{post_params}"
		@post = Post.new(post_params)
		if @post.save 
			Rails.logger.debug "Saved a post with title #{@post.title} and body #{@post.body}"
			redirect_to posts_path
		else 
			Rails.logger.debug "Failed to create a post"
			redirect_to new_post_path
		end
	end

	def edit
	end

	def update
	end 

	def show
		Rails.logger.debug "Looking for a post with id = #{params[:id]}"
		@post = Post.find(params[:id])
		Rails.logger.debug "Found post #{@post}"
	end 

	def destroy
	end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
    	Rails.logger.debug "Param is #{params}"
      	params.require(:post).permit(:title, :body)
    end
end
