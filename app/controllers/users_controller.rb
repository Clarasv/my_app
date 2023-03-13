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
      email: params[:email],
      image_name: "default_user.jpg"
      )
    if @newuser.save
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
     render("/users/#{@edituser.id}/edit", status: :unprocessable_entity)
   end
  end 
  
end
