class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "投稿しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.id == @blog.user.id
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: "編集しました。"
      else
        render :edit
      end
    else
      redirect_to blogs_path, notice: "他のユーザーの投稿は編集できません。"
    end
  end

  def destroy
    if current_user.id == @blog.user.id
      @blog.destroy
      redirect_to blogs_path, notice: "削除しました。"
    else
      redirect_to blogs_path, notice: "他のユーザーの投稿は削除できません。"
    end
  end

  def show
  end

  private

  def blog_params
    params.require(:blog).permit(:image, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
