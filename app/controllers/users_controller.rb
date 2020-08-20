class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
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
    @user = Message.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "更新しました。"
    else
      flash.now[:alert] = "入力に不備があります。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :image, :nickname)
  end
end
