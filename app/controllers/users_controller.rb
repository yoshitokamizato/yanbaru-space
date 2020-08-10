class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
    @users_skills = @user.user_skills.map {|skill| skill.skill.name}
  end

  def edit
    @user = User.find(params[:id])
    @skills = Skill.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    users_skills = UserSkill.where(user_id: current_user.id).pluck(:skill_id)
    selected_skill_ids = params[:user][:id].map!(&:to_i)
    selected_skill_ids.each do |skill_id|
      unless users_skills.include?(skill_id)
        UserSkill.create(user_id: current_user.id, skill_id: skill_id)
      end
    end

    delete_skills = users_skills - selected_skill_ids
    UserSkill.where(skill_id: delete_skills).destroy_all

    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "更新しました。"
    else
      flash.now[:alert] = "入力に不備があります。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :image, :nickname, :id)
  end
end
