class HomesController < ApplicationController
  def index
    @topics = Topic.first(5)

    @user = User.first(5)
  end
end
