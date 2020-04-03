class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "投稿しました。"
    else
      render :new
    end
  end

  def edit
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def blog_params
    params.require(:blog).permit(:image, :content)
  end
end
