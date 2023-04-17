class RelevancesController < ApplicationController
  before_action :authenticate_user
  
  def create
    following = @current_user.relevances.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || root_path
  end 
  
  def destroy
    following = @current_user.relevances.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root.path
  end 
  
end
