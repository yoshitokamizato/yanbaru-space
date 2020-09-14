class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users_skills = @user.skills.map {|skill| skill.name}
    if user_signed_in?
      @currentUserEntry = current_user.entries
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
      unless @isRoom

        @room = Room.new
        @entry = Entry.new
      end
       end
     end
  end

  def new
    @user = User.find(current_user.id)
    @users_skills = @user.skills.map {|skill| skill.name}
  end

  def edit
    @user = User.find(params[:id])
    @skills = Skill.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "更新しました。"
    else
      flash.now[:alert] = "入力に不備があります。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :image, :nickname, {  skill_ids: [] })
  end
end
