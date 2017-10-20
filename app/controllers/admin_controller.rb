class AdminController < ApplicationController
  def index
    @total_students = Student.count
  end
end
