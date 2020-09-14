class RemoveSkillFromUserSkills < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_skills, :skill, :string
  end
end
