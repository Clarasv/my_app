class UsersController < ApplicationController
  def index
   @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end 
  
  def new
    @newuser = User.new 
  end
  
  def create
    @newuser = User.new(
      name: params[:name],
      email: params[:email]
      )
    if @newuser.save
      redirect_to("/users/index")
      flash[:notice] = "登録が完了しました！"
    else
      render("/users/new")
      flash[:notice] = "登録に失敗しました"
    end
  end 

end
