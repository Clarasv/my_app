class PostsController < ApplicationController
  def index
    @post = Post.all.order(created_at: :desc)
  end
  
  def show 
    @post = Post.find_by(id: params[:id])
  end 
  
  def new
    @post = Post.new
  end 
  
  def create
    @post = Post.new(title: params[:title])
    if @post.save
      redirect_to("/posts/index")
      flash[:notice] = "投稿が完了しました"
    else
      render("posts/new")
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
      render("/posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    
    redirect_to("posts/index")
  end 
  
end
