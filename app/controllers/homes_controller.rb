class HomesController < ApplicationController
  def index
    @topics = Topic.first(5)
    @users = User.first(5)
    @menus = Menu.first(5)
    @events = Event.last(5).reverse
  end
end
