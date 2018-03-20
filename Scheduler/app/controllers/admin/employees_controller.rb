module Admin
  class EmployeeUsersController < Admin::ApplicationController
    def index
      @employees = Employee.all
    end
  end
end
