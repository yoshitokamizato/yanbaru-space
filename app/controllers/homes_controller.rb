class HomesController < ApplicationController
  def index
    @topics = Topic.all
  
    @user = User.first(5)
  end
end
