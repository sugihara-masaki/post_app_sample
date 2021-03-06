class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

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
      
      flash[:success] = "投稿完了!!"
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
    params.require(:post).permit(:title, :image, :content)
  end
end
