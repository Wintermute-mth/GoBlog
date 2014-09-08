class PostsController < ApplicationController
  def index
    @post = Post.new
  	@posts = Post.all.sort_by { |post| post.comments.size }.reverse
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.js
      else
        format.js { render 'error.js.erb' }
      end
    end
  end

  def update
  	@post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.js { render js: %(window.location.href='#{root_path}') }
      else
        format.js { render 'error.js.erb' }
      end
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

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
  	params.require(:post).permit(:name, :text)
  end
end
