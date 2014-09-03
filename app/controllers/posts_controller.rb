class PostsController < ApplicationController
  def index
    @post = Post.new
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

    respond_to do |format|
      if @post.save
    	  format.js
        format.json { render json: @post, status: :created, location: @post }
      else
        render root_path
      end
    end
  end

  def update
  	@post = Post.find(params[:id])

    if @post.update(post_params)
  	  redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
    respond_to do |format|
  	   format.js
    end
  end

  private

  def post_params
  	params.require(:post).permit(:name, :text)
  end
end
