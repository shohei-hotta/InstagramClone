class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]

  def index
    @blogs = Blog.all.order(:created_at)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿しました。"
      else
        render :new
      end
    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
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
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def favorite_index
    @blogs = current_user.favorite_blogs.order(:created_at)
  end

  private

  def blog_params
    params.require(:blog).permit(:image, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
