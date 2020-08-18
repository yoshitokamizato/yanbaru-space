class SkillsController < ApplicationController
  private
  def user_params
    params.require(:skill).permit(:skill)
  end
end
