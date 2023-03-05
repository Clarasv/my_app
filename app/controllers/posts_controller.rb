class PostsController < ApplicationController
  def index
    @post = Post.all.order(created_at: :desc)
  end
  
  def show 
    @post = Post.find_by(id: params[:id])
  end 
  
  def new
  end 
  
  def create
    @post = Post.new(title: params[:title])
    if @post.save
      redirect_to("/posts/index")
    end
  end
  
  def edit
    @edit = Post.find_by(id: params[:id])
  end

  def update
    @upd = Post.find_by(id: params[:id])
    @upd.title = params[:title]
    if @upd.save
     redirect_to("/posts/index")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    
    redirect_to("/posts/index")
  end 
  
end
