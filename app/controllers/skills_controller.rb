class SkillsController < ApplicationController
  def create
  end

  private
  def user_params
    params.require(:skill).permit(:skill)
  end
end
