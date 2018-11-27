# Handles creating comments for a Blog post by a User
class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
