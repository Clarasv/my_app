class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}
  
  def index
    @post = Post.all.order(created_at: :desc)
  end
  
  def show 
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end 
  
  def new
    @post = Post.new
  end 
  
  def create
    @post = Post.new(
      title: params[:title],
      user_id: @current_user.id
      )
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/posts/index")
    else
      render("posts/new", status: :unprocessable_entity)
    end 
  end
  
  def edit
    @edit = Post.find_by(id: params[:id])
  end

  def update
    @edit = Post.find_by(id: params[:id])
    @edit.title = params[:title]
    if @edit.save
     redirect_to("/posts/index")
     flash[:notice] = "投稿を編集しました"
    else
      render("/posts/edit", status: :unprocessable_entity)
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
     flash[:notice] = "投稿を削除しました"
     redirect_to("/posts/index", allow_other_host: true)
    end
  end 
  
    def ensure_current_user
     @post = Post.find_by(id: params[:id])
     if @post.user_id != @current_user.id
      flash[:notice] = "[警告！]　現在のユーザーには指定URLの編集権限がありません。"
      redirect_to("/posts/index")
     end
    end
  
end
