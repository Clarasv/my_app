class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :authenticate_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "この操作にはログインが必要です"
      redirect_to signup_users_path
    end
  end
end

