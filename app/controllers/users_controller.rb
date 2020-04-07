class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to blogs_path, notice: "アカウント登録が完了しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user.id == @user.id
      if @user.update(user_params)
        redirect_to user_path, notice: "アカウントを編集しました。"
      else
        render :edit
      end
    else
      redirect_to user_path, notice: "他のユーザーのプロフィールは編集できません。"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :comment)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
