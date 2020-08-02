class HomesController < ApplicationController
  def index
    @topics = Topic.first(6)
    @users = User.first(12)
    @menus = Menu.first(6)
    @events = Event.last(6).reverse
  end
end
