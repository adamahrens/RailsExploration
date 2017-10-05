class UserController < ApplicationController
  def index
    @users = User.where('type IS NULL')
  end
end
