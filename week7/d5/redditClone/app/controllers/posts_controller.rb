class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to post_url(@post)
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end
end
