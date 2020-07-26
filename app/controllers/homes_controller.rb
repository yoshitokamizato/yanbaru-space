class HomesController < ApplicationController
  def index
    @topics = Topic.first(5)

    @user = User.find(current_user.id)
  end
end
