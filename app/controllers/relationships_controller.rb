class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    @current_user.follow(@user)
    redirect_to("/users/#{params[:followed_id]}")
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    @current_user.unfollow(@user)
    redirect_to("/users/#{params[:followed_id]}")
  end
  
    def authenticate_user!
    unless @current_user
      flash[:notice] = "ログインしてください"
      redirect_to new_user_session_path
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
end
