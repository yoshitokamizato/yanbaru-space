class HomesController < ApplicationController
  def index
    @topics = Topic.all
  end
  
  def logging_user
    @user = User.find(current_user.id)
  end
end
