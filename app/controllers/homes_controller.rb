class HomesController < ApplicationController
  def index
    @news = New.all
  end
end
