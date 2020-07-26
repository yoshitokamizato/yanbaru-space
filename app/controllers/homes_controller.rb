class HomesController < ApplicationController
  def index
    @topics = Topic.all
    @topics = Topic.first(5)
    @user = User.find(current_user.id)
    @users = User.first(5)
  end
end
