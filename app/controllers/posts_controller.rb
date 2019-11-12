class PostsController < ApplicationController
  def new
    if current_user.nil?
      redirect_to root_path
    else
      @post = current_user.posts.build
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end
end
