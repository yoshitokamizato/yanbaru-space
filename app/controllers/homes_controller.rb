class HomesController < ApplicationController
  def index
    @topics = Topic.all
    @user = User.find(current_user.id)
    @users = User.all.page(params[:page]).per(5)

   return unless request.xhr?
   case params[:type]
   when 'user'
      render "#{params[:type]}"
   end
  end
end
