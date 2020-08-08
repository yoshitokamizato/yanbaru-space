class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @skills = @user.skills
  end

  def edit
    @user = User.find(params[:id])
    @skills = Skill.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    binding.pry
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "更新しました。"
    else
      flash.now[:alert] = "入力に不備があります。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :image, :nickname, skills_attributes: [:id, :skill])
  end
end
