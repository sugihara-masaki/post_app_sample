class PostsController < ApplicationController
  def new
    if current_user.nil?
      redirect_to root_path
    else
      @post = current_user.posts.build
    end
  end
end
