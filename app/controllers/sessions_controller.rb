class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:type_of_user] = user.Type_of_user.type_of_user
      if session[:type_of_user] == "Administrator"
        redirect_to admin_url
      end
      if session[:type_of_user] == "Parent"
        redirect_to son_url
      end
      if session[:type_of_user] == "Teacher"
        redirect_to teacherv_url
      end
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:type_of_user] = nil
    redirect_to home_index_url, notice: "Logged out"
  end
end
