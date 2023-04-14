class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :ensure_current_user, {only: [:edit, :update]}
  
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
      email: params[:email],
      image_name: "default_user.jpg",
      password: params[:password]
      )
    if @newuser.save
      session[:user_id] = @newuser.id
      redirect_to("/users/index")
      flash[:notice] = "登録が完了しました！"
    else
      render("/users/new", status: :unprocessable_entity)
    end
  end 
  
  def edit
    @edituser = User.find_by(id: params[:id])
  end 
  
  def update
    @edituser = User.find_by(id: params[:id])
    @edituser.name = params[:name]
    @edituser.email = params[:email]
    
   if params[:image]
     @edituser.image_name = "#{@edituser.id}.png"
     images = params[:image]
     File.binwrite("public/users_images/#{@edituser.image_name}", images.read)
   end

   if @edituser.save
     flash[:notice] = "ユーザー情報を編集しました"
     redirect_to("/users/index")
   else 
     render :edit, status: :unprocessable_entity
   end
  end 
  
  def destroy
    @edituser = User.find_by(id: params[:id])
    if @edituser.destroy
     flash[:notice] = "アカウントを削除しました"
     render :login_form, status: :unprocessable_entity
    end
  end 
  
  def login_form
  end
  
  def login
    @loginuser = User.find_by(email: params[:email])
   if @loginuser && @loginuser.authenticate(params[:password])
     session[:user_id] = @loginuser.id
     flash[:notice] = "ログインしました"
     redirect_to("/posts/index")
   else
     @error_message = "ログインに失敗しました"
     @email = params[:email]
     @password = params[:password]
     render("users/login_form", status: :unprocessable_entity)
   end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login", status: :see_other)
  end
  
  def ensure_current_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "[警告！]　現在のユーザーには指定URLの編集権限がありません。"
      redirect_to("/posts/index")
    end
  end
  
  def followings 
    user = User.find(params[:id])
    @users = user.followings
  end 
  
  def followers
    user = User.find(params[:id])
    @users = user.followers
  end 
  
end