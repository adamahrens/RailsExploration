class UserController < ApplicationController
  def index
    @users = Employee.all
  end
end
