class PostsController < ApplicationController
  def index
    @post = [
      "今日からRailsの勉強",
      "がんばります"
      ]
  end
end
