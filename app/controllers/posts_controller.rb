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
  
  
end
